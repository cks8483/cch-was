"use strict";

const UserStorage = require("./UserStorage");

class User{
  constructor(body){
    this.body=body;
  }

//async, await : 프라미스를 좀 더 편하게 활용 async이 먼저 실행되기를 기다리고 await가 이후에 실행함.

  async login() {
    const client = this.body
    
    const { id, psword} = await UserStorage.getUsersInfo(client.id);
    console.log(id, psword);
    
    if(id){
        if(id === client.id && psword === client.psword){
            return { success: true};
        }
        return {success: false, msg: "비밀번호가 틀렸습니다."};
    }
    return { success: false, msg: "존재하지 않는 아이디 입니다." }
  }

  async register(){
    const client = this.body;
    try{
        const response = await UserStorage.save(client);
        return response;
        } catch(err){
            return { success: false, msg: "존재하는 아이디 입니다."};
        }
  }
}

module.exports = User;
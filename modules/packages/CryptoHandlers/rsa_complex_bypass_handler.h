/*
 * Copyright 2004-2017 Cray Inc.
 * Other additional copyright holders may be indicated within.
 *
 * The entirety of this work is licensed under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License.
 *
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#undef I
#include <openssl/rsa.h>
#include <openssl/evp.h>
#undef I
#ifdef _Imaginary_I
#define I _Imaginary_I
#else
#define I _Complex_I
#endif
typedef const EVP_MD* CONST_EVP_MD_PTR;
typedef const EVP_CIPHER* CONST_EVP_CIPHER_PTR;

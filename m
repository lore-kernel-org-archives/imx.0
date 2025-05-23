Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C7221129D
	for <imx@lists.linux.dev>; Fri, 23 May 2025 23:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748042528; cv=none; b=LpuNkN1Tlg1zFqnjhhQVl8Uw+9tqxwgwzKq/YAUya05c99EbBr+B3sTZ2Nlditn62TpU6WceG9Dn6ioPEEtx07NyunyvtFw/+M+E7KvpPyoDlrTpEu2lax7xz+9RFVQ8noTrwPuna9c69I6FEzDA6vm/ADkP8WhOqENHOWXZV3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748042528; c=relaxed/simple;
	bh=0M6BIbKkCL4BuQHLkwNfOtXVF4FD4eT1saE9fb6Qwh8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JIMrCMGgOqYVj9cRz83elMDr0+zPieH5POg1t+CgqD6p7tKmY4xBNSVvf3kXJ1CBMFp2Q26/3rJhkWVa3707S3kFPKyQFXlsfR/6fa/+pgRejCgumJHc1/ACLh4pbR+beNWr6tZFp6ttD0+WoqLeanEM8KLYdArG4qwKrAIVjRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=0AcGmDs2; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="0AcGmDs2"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c5e39d1e0eso32767885a.1
        for <imx@lists.linux.dev>; Fri, 23 May 2025 16:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1748042526; x=1748647326; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0M6BIbKkCL4BuQHLkwNfOtXVF4FD4eT1saE9fb6Qwh8=;
        b=0AcGmDs2ks6v1yrAVMuK7ZO8ZOvLvp0wqKeWfWnpKRdT14HEa5OuoxwGCh5WO2tCxt
         dJjYIM5LgDCfqHxpYaimb4sUat4HSqGW8VIFAi6nRpmvhp9JcEB79qikd88qnMVZJCCy
         dUXRWsvhDaXkC4xCljIFGEoiILLnPgeBxp3SeKeziraVNv67mvvXFHHZuCK6G9D8WdLs
         ssUosLRxVsXSZ+ir46TIpZPLum0/Ose5c8fIW6JcjAKxJjXqv2//rV8Sl+uZei5hjwFi
         9+aMWcY/e9CNMX6yxFy48LiZbQydDxPF/3rPPOuEnCtxtHiB7Ju+dw+FZKwDWp6ud2+F
         aFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748042526; x=1748647326;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0M6BIbKkCL4BuQHLkwNfOtXVF4FD4eT1saE9fb6Qwh8=;
        b=bXKgKZWhz36zIbBVELG2BA8hqOj2DmEIM0iQeIie42YV8CEzx2Leik+0G9WlRmkvjI
         ixxgF/a7xqJWabE/pbwO7hz5Q50D9HF+PmsLAJsH5gHWLbCX04s1WswJgS3Q/ZshTWSN
         KjyQUIAYU2cFwvAjv1MZMuk2FgF1DFF8oFhwBMdAFAFVlM8bNKMRhOWUD9peT763d7wT
         fkBe0XkKUnIh582A1DdH58occbWU7/8Y9GU1N6fOvZS31RvwVYm5zQiVtiUtNE85kjzd
         ceTCkssGpKEXm722b9eJPWOUoVoMVAZsF0O9+4s4C08fdvAZaU2Y/WdkPZFfloS98eOx
         T0Pw==
X-Gm-Message-State: AOJu0YwiwBSdpLKrsTKbKsymjtZ/ArtiZgqYmzyTYTUKgOkUGJso3wFm
	fb2p9svbejoax9DEWwOF9h1VWGvOWh1UUDvsirmytTLA3RyXbRgHJAjiCTZDg3Pqeas=
X-Gm-Gg: ASbGncvuVndPvOXddT6EB1nHYuuzuiuwASwDQPvbsOj+gQpF0hpZWP67+D8qhLRR9pM
	VhORKH78OUP2GrtjYCtqTJMNIq0GwBE5YQFJ5+MTP7i0eE0fcv0D8BmP6voEcIHdyBvCPgesNiO
	HTyDceJIE0PGR7v82w/1dfuYV8plf4PhQDFhip7Ci9VBhvMUfz/0LrwjlEb3uIbw/oFtaMU4b+O
	G9Od38d5QkJsAkgJs0H26PcwUphrremvZA2YxcdGvEer4BLFO13eMFCbDda0nWB4ld4LiHRo5Dr
	Oej0mIB/S80TELJCqfoLkmR8E+Q2GA2AvXYwfWrLCHVE1W3tmbTq3lCK
X-Google-Smtp-Source: AGHT+IEIMXrXdUEGP0sasHkicBsBeTsvbtxxsfrCzTtv247fRI8qwLbIJGGL+3bJAWxBYrqeC4TcKQ==
X-Received: by 2002:a05:620a:319c:b0:7ca:dac1:a2d9 with SMTP id af79cd13be357-7ceecbe014fmr161204785a.28.1748042525994;
        Fri, 23 May 2025 16:22:05 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b2fc::c41? ([2606:6d00:17:b2fc::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467ef2fbsm1249034185a.59.2025.05.23.16.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 16:22:05 -0700 (PDT)
Message-ID: <eef5ccd99d82dd33e3a4ecdb5d4a5b75ccb0b972.camel@ndufresne.ca>
Subject: Re: [PATCH RESEND 1/2] media: dt-bindings: nxp,imx8-jpeg: Add
 compatible strings for IMX95 JPEG
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Frank Li <Frank.Li@nxp.com>, mirela.rabulea@nxp.com, mchehab@kernel.org,
 	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, 	s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, 	krzysztof.kozlowski@linaro.org
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, ming.qian@nxp.com
Date: Fri, 23 May 2025 19:22:04 -0400
In-Reply-To: <20250521173444.310641-1-Frank.Li@nxp.com>
References: <20250521-95_jpeg-v1-0-392de5d29672@nxp.com>
	 <20250521173444.310641-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

SGksCgpMZSBtZXJjcmVkaSAyMSBtYWkgMjAyNSDDoCAxMzozNCAtMDQwMCwgRnJhbmsgTGkgYSDD
qWNyaXTCoDoKPiBBZGQgY29tcGF0aWJsZSBzdHJpbmdzICJueHAsaW14OTUtanBnZGVjIiBhbmQg
Im54cCxpbXg5NS1qcGdlbmMiLCB3aGljaAo+IGFyZSBiYWNrd2FyZCBjb21wYXRpYmxlIHdpdGgg
Im54cCxpbXg4cXhwLWpwZ2RlYyIgYW5kCj4gIm54cCxpbXg4cXhwLWpwZWdlbmMiLiBpLk1YOTUg
anVzdCBuZWVkIG9uZSBwb3dlciBkb21haW4gd2hpY2ggY29tYmluZQo+IHdyYXAgYW5kIGFsbCBz
bG90cyB0b2dldGhlci4gUmVkdWNlIG1pbkl0ZW1zIG9mIHBvd2VyLWRvbWFpbnMgdG8gMSBmb3IK
PiBpLk1YOTUgYW5kIGtlZXAgdGhlIHNhbWUgcmVzdHJpY3Rpb24gZm9yIG90aGVycy4KPiAKPiBS
ZXZpZXdlZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5h
cm8ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPgoKQWNr
ZWQtYnk6IE5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbT4K
CktyenlzenRvZiwgd2lsbCB5b3UgdGFrZSB0aGlzIG9uZSBvbmNlIHRoZSBEVFMgcGFydCBpcyBy
ZWFkeSA/CgpyZWdhcmRzLApOaWNvbGFzCgo+IC0tLQo+IMKgLi4uL2JpbmRpbmdzL21lZGlhL254
cCxpbXg4LWpwZWcueWFtbMKgwqDCoMKgwqDCoMKgwqAgfCAyOCArKysrKysrKysrKysrKysrKy0t
Cj4gwqAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL254
cCxpbXg4LWpwZWcueWFtbAo+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21l
ZGlhL254cCxpbXg4LWpwZWcueWFtbAo+IGluZGV4IDJiZTMwYzVmZGM4MzkuLjRjYmE0MmJhN2Nm
NzIgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlh
L254cCxpbXg4LWpwZWcueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZWRpYS9ueHAsaW14OC1qcGVnLnlhbWwKPiBAQCAtMjIsMTAgKzIyLDE0IEBAIHByb3Bl
cnRpZXM6Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gbnhwLGlteDhxeHAtanBnZGVjCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gbnhwLGlteDhxeHAtanBnZW5jCj4gwqDCoMKgwqDC
oMKgIC0gaXRlbXM6Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBueHAsaW14OHFtLWpw
Z2RlYwo+ICvCoMKgwqDCoMKgwqDCoMKgwqAgLSBlbnVtOgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAtIG54cCxpbXg4cW0tanBnZGVjCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC0gbnhwLGlteDk1LWpwZ2RlYwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gY29uc3Q6IG54cCxp
bXg4cXhwLWpwZ2RlYwo+IMKgwqDCoMKgwqDCoCAtIGl0ZW1zOgo+IC3CoMKgwqDCoMKgwqDCoMKg
wqAgLSBjb25zdDogbnhwLGlteDhxbS1qcGdlbmMKPiArwqDCoMKgwqDCoMKgwqDCoMKgIC0gZW51
bToKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBueHAsaW14OHFtLWpwZ2VuYwo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIG54cCxpbXg5NS1qcGdlbmMKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAtIGNvbnN0OiBueHAsaW14OHF4cC1qcGdlbmMKPiDCoAo+IMKgwqAgcmVnOgo+
IEBAIC00OCw3ICs1Miw3IEBAIHByb3BlcnRpZXM6Cj4gwqDCoMKgwqAgZGVzY3JpcHRpb246Cj4g
wqDCoMKgwqDCoMKgIExpc3Qgb2YgcGhhbmRsZSBhbmQgUE0gZG9tYWluIHNwZWNpZmllciBhcyBk
b2N1bWVudGVkIGluCj4gwqDCoMKgwqDCoMKgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9wb3dlci9wb3dlcl9kb21haW4udHh0Cj4gLcKgwqDCoCBtaW5JdGVtczogMsKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgIyBXcmFwcGVyIGFuZCAxIHNsb3QKPiArwqDCoMKgIG1pbkl0
ZW1zOiAxwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAjIFdyYXBwZXIgYW5kIGFsbCBzbG90
cwo+IMKgwqDCoMKgIG1heEl0ZW1zOiA1wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAjIFdy
YXBwZXIgYW5kIDQgc2xvdHMKPiDCoAo+IMKgcmVxdWlyZWQ6Cj4gQEAgLTU4LDYgKzYyLDI0IEBA
IHJlcXVpcmVkOgo+IMKgwqAgLSBpbnRlcnJ1cHRzCj4gwqDCoCAtIHBvd2VyLWRvbWFpbnMKPiDC
oAo+ICthbGxPZjoKPiArwqAgLSBpZjoKPiArwqDCoMKgwqDCoCBwcm9wZXJ0aWVzOgo+ICvCoMKg
wqDCoMKgwqDCoCBjb21wYXRpYmxlOgo+ICvCoMKgwqDCoMKgwqDCoMKgwqAgY29udGFpbnM6Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZW51bToKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgLSBueHAsaW14OTUtanBnZW5jCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gbnhw
LGlteDk1LWpwZ2RlYwo+ICvCoMKgwqAgdGhlbjoKPiArwqDCoMKgwqDCoCBwcm9wZXJ0aWVzOgo+
ICvCoMKgwqDCoMKgwqDCoCBwb3dlci1kb21haW5zOgo+ICvCoMKgwqDCoMKgwqDCoMKgwqAgbWF4
SXRlbXM6IDEKPiArwqDCoMKgIGVsc2U6Cj4gK8KgwqDCoMKgwqAgcHJvcGVydGllczoKPiArwqDC
oMKgwqDCoMKgwqAgcG93ZXItZG9tYWluczoKPiArwqDCoMKgwqDCoMKgwqDCoMKgIG1pbkl0ZW1z
OiAywqDCoMKgwqDCoMKgwqAgIyBXcmFwcGVyIGFuZCAxIHNsb3QKPiArCj4gKwo+IMKgYWRkaXRp
b25hbFByb3BlcnRpZXM6IGZhbHNlCj4gwqAKPiDCoGV4YW1wbGVzOgo=


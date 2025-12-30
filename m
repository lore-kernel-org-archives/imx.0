Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18D125A645
	for <imx@lists.linux.dev>; Tue, 30 Dec 2025 01:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767059627; cv=none; b=qXetvhtCDfsmbzJ/zLQbV0aEYnydMN9p9R7Nq7wawIGqG9okYu7pyO/vVGUl4KoBAf4UgTXsr9aQqsYxDB1KoMsnPnWEeHZ22L3LEqGhGP8fioKHil7ZpYC/RT+LJiLFI3DX7rd28zi/t+UONbmtRjy7LV2p2MzVi6mQnL2GQ4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767059627; c=relaxed/simple;
	bh=9LwppNYSzH8+UAgZL7BbjTF/X6jtIOh2exhRpeQkq20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k2qvfOTx8cQuGqb7+JYdnrZhZpkUswosiv3Lv9ud1wEbWe3EBfmsz5zH/ZdCdotzgbwQcROlV2aPdFAbvks9uc3TZmLYKWfV6BWTkFlzvrw90LUbjVJ6PwHHrcVv+/2QF0tHB/M9jfntfB1Vqft9Pl4hiBOAE9Tlk7eqvqxub0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=rRJ7mr/J; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="rRJ7mr/J"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dgGMp3Cbxz9tdM;
	Tue, 30 Dec 2025 02:53:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767059622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qpoUGD/nQvuwJGs8fSJGimVrIe44lQKhSJUrrOso058=;
	b=rRJ7mr/JsYyKdWNKh7HM16eTWtEuXu3tGnUJvaLOG+/MmkoEP2Ld02L3Pd+X9FMr4VCDjC
	r9ZyLZc1pkNFyA6vi4mHIZ2gt+QCZu0jKpNiRErAfE4us89kDbNFrTLRaBNjkbCQN+QNZ5
	I9GR1TtcsrLkuugM0KLHyh9XDpLRWK72IGVTGBO4LcayOQEQ9SVfPFBiBJIX/37C06L3LT
	uJe6KgnpkbncENJQMzxeRRDWMXN+wDVViQUCSyG7OrWhKh5JT/F4Lvm2pIMW9AgDu2He3z
	YGkgcySP7IiYm6ufYpWUZKWBroUnP2m2Q3iZKkt2qC20pomA5LK/aHJJXIALKg==
Message-ID: <53ea529f-3538-4ab5-aa99-0caa6729b4cd@mailbox.org>
Date: Tue, 30 Dec 2025 02:53:38 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: imx95: Use GPU_CGC as core clock for GPU
To: peng.fan@nxp.com, shawnguo@kernel.org, Frank.li@nxp.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, festevam@gmail.com,
 imx@lists.linux.dev, kernel@pengutronix.de, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org,
 s.hauer@pengutronix.de, Rain Yang <jiyu.yang@oss.nxp.com>
References: <20251129143220.14834-1-marek.vasut@mailbox.org>
 <aS-lEibp3zTsaR6T@oss.nxp.com>
 <c6e0e55a-06da-4665-972e-e9b5b8c08bf7@mailbox.org>
 <aTACuRjC_Zpf8IOU@oss.nxp.com>
 <de36091e-c890-4897-b3e3-2a7575029a5d@mailbox.org>
 <aTD5np-HGaJqhzkD@oss.nxp.com>
 <5944d872-01a3-47e9-977b-029f3be4fd83@mailbox.org>
 <aTKVMAMQ6v_BwD6R@oss.nxp.com>
 <9b593731-898f-46a7-8ee5-68f8c170351c@mailbox.org>
 <aTYxm_dfMwF4H0_b@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aTYxm_dfMwF4H0_b@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 21bcf49a433a8f6c4b4
X-MBO-RS-META: 4dfs449y7anjdqiphj1bofd5kx8drorp

On 12/8/25 3:02 AM, Rain Yang wrote:

>>> Okay, I’ll submit a patch later.
>>> The commit message should reflect that only CLK_GPU_CGC is enabled.
>>
>> The commit message , and this change , is unrelated to GPUAPB clock.
> The commit message is ambiguous. Could you clarify which parent clock
> you are referring to, and whether it can be enabled by CLK_GPU_CGC?
> If it was CLK_GPU, CLK_GPU_CGC can't be able to control it.

The commit message clearly states "These new GPU_CGC clock
gate the existing GPU clock." and "GPU_CGC as well as its parent GPU 
clock." , I don't perceive any ambiguity, sorry.

Frankly, the whole GPUAPB discussion is entirely unrelated and it only 
stalls application of this bugfix and keeps upstream broken. This is not 
helping.

So unless there is anything in particular that is on-topic and prevents 
this patch from being applied, it would be good to apply it, otherwise 
the GPU on MX95 in mainline Linux is not working.

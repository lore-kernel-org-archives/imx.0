Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23661DDB2
	for <imx@lists.linux.dev>; Fri, 19 Jul 2024 04:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721364047; cv=none; b=s8lw9tvHEwXhJX9wPX7+BZj3uHJaQVsANpXkzP0o1PRe1KI/ZA9+E6f1q48dk7QO9k09febgnEpMNoBUQn2wPwhvKnyyZzD4RM6FBw2aa81PZE9u9b0aXnP4XqnA4Cvpr1vA9uyyKmRCuiH21seVx06zXWMT9EPMBWE0UUBn1aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721364047; c=relaxed/simple;
	bh=KosC7TNVQM3Rt8nCJcEeOKxCaqsinCuIpPmPwSwY+iY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tu9NjR+bhh9aRyc+87OAcb2LkIxXio0Mn7VWQzLfQ2mGoIz7LG7SnrYZ31APxkPdDjA1VlRjcLVnt7189l7GozZjRQBlncGUwzhb6WbSsiuVebEXLr8N+kE5OXuKibQb/OBnSFre0wmxAw9GUBVo/iBoqQCFZikv28tnuKkUgEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=BaDPZRZ4; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="BaDPZRZ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1721364028; x=1721968828; i=wahrenst@gmx.net;
	bh=KosC7TNVQM3Rt8nCJcEeOKxCaqsinCuIpPmPwSwY+iY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=BaDPZRZ42NH0lLN3cLiCq1Oe7BaB5apQdW/rmKFaTBRpeueDGVZ2nnbmjzlI1ZBo
	 2XOjWkrk78mMjyrztoGNASfiz7c9kfCsXM5V+0nGj3QDvBNs9tdo1o6xScb6avdPU
	 VQR2SJ4STRrxllcjDNTfIDyPam70YokXqA2iPu8Q1hqqjKTvePdb9bwMVqvOPKgCB
	 FfdKb7AYe8AxFM+CaIGfAC5WI1jeSn2BrQel9ZBI7lbuR3dN3erFT16pMr45UgSCW
	 Dl/dlPk4mH8RXT/iWTBQ7CLmI8e+1VND6/l15iG7S1RyEPJFED5XsyKS2HPBkV+Ar
	 9AVdlJn6O/locdl9GQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MDysm-1seWlz3iAW-006C6i; Fri, 19
 Jul 2024 06:40:27 +0200
Message-ID: <fffe2044-515c-437f-95b1-b793ba0be5aa@gmx.net>
Date: Fri, 19 Jul 2024 06:40:26 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mx93: No cache hierachy definitions for ARM cores
To: Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <bffb5d44-4eca-49cb-8624-e7bcce525fbb@gmx.net>
 <CAOMZO5DDk6eX+Ad9zKZmaEVvRHwFDETwuA=J7366QCRqhq_ZLw@mail.gmail.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <CAOMZO5DDk6eX+Ad9zKZmaEVvRHwFDETwuA=J7366QCRqhq_ZLw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:x1Dbd1ZoXSQf9pwosY683uPJJsofa4auhTgbAP5LiBuFPPW1LNW
 G4hwXTUKbCdayQy4jBNnXtOcsMDardwhrqOzLPCXKZWLo4fktbPeOjdSytNF4JEIPofJWF5
 F+DwlVieaa9K3C47uqqWL/EWOjmojOOE5KDk4jgwFLsZGaiyPcoOcDmbBPt6N1O/yWc3oM7
 H5n6F6vaxYl7dB8XdKmVA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:rJFBQrSnXhQ=;uvf/Ok24/7GfkM1j6g4YAilBzzV
 PZXS0937WNyl2az1xzlSITsELw7xzJQFHFgtYDYdm5C+j+ukG6iQsA297vV2j55SfB6BChdSr
 0aN+/mitnpoTrc65xc573heRLShiLX/HlWsb+TR/ZPMigZXtywLOg/wR+zXmBtfsTo7+MWCa1
 Yw22sVH0UevR/RjKZz11nAAFshhrOOHuL2hxF5xN1n3MHbZRPCUxO90ZBGqt5asV+chqZIDQT
 Ro0L5KTZcsoopcM4lMLcc1rrwNvJm9yWZ5oXVQlJ+T6Q5BMh4HQGldStdaWJFtdlaKUjZLUw7
 gyQ5gvWPWqaJ19XWKGNtbDfEuQPmieCsjogUxpOra9S3gBaBbzDP5ZdFloqrY8tILEhG6FFm1
 QqHI4c6G4RvRI3kRFT7ihFgCbwet4eP5+2G5ccnpP9PlzF/HKOstgr/NBh0Gcy9hgLDs//ueK
 +uG5dys6qExRDhFHHbiL6qbkOU3nxQFElh5iKpyRcR4ERtbrbDylJgqL3hS3DXq+NrT9+EN56
 Kjt5gEosEGJibpMrmLJMZL1Eqgj4eJHYU5RY9axaVbCpT1e+hHie18jvi7FvrxnlXb+FcNuKS
 sudwlrC++D7IwOzc3QK+DmhN6fo3Ni3YqPflx7YDspSLiAS52hDD7P49RJpHrd3ltkZitF7eb
 KwXPx84IJlFBr6jfrKN1xGChYmban4pckSfCFYQjs27/AL7YiZzS8qqkxhmF1PwKfTVdu+uZP
 1s+j/Ak2aTnVk5+qIIbMCNXQDIO/yugPZqGXI0seQD9/rgHkIQWWATDY5juqvpWIPOkHhpkRV
 7pQi0wWxGwXJQvvUuizhFsFQ==

Hi,

Am 19.07.24 um 04:38 schrieb Fabio Estevam:
> On Wed, Jul 17, 2024 at 2:49=E2=80=AFPM Stefan Wahren <wahrenst@gmx.net>=
 wrote:
>> Hi,
>> today i noticed that imx93.dtsi lacks the cache definitions for the
>> Cortex-A55 cores:
>>
>> cacheinfo: Unable to detect cache hierarchy for CPU 0
>>
>> Maybe someone with more insight can add this to the imx93.dtsi file.
> Frank, can you help?
>
the description for caches can be found in the device tree spezification
[1]. AFAIK there is no specific binding in the kernel documentation.
Maybe a good example for reference would be [2].

Regards

[1] - https://github.com/devicetree-org/devicetree-specification
[2] -
https://elixir.bootlin.com/linux/v6.10/source/arch/arm64/boot/dts/rockchip=
/rk3588s.dtsi

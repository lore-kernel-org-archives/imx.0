Received: from mx-relay48-hz3.antispameurope.com (mx-relay48-hz3.antispameurope.com [94.100.134.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93437345CA2
	for <imx@lists.linux.dev>; Fri, 20 Feb 2026 13:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.237
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771593290; cv=pass; b=F46v9+CBg5YSf5uLLXdgV6m3UMPk44sdL9M9glMSpMqEhUx8MgG4rVJ5sbKg2RCBoKQUugKtiixxt6s6GNils4zyDYqeW0NUb47XIqBoBxsJF/Fog5rMSF0seTSUc25Ghn3cUWfi1Kem6AIcLc66w1jarUlujV+uaoEOJBNr3pE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771593290; c=relaxed/simple;
	bh=qM+yIWyw0RFaLdOwB/33YpLqhLZR8QofbkQnw3Dellc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Peh18NmTHdo28rfZMnjXlyyFsh8eKGKI869r30SRoagUtT45SGbOFry/TVhezbDdOISpbptK+i2t34Sad5ZaMuSz8qUHW39RuDmYwmryTx8lX0FXZ9+gCef9SaUjEPb6iYFR/zEUgsqXpgQgLHSI/cpAfGchWCSwl1U5KA7axoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=oLvN8D/7; arc=pass smtp.client-ip=94.100.134.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="oLvN8D/7"
ARC-Authentication-Results: i=1; mx-gate48-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=2MjKH69EZTy6SNbmhiR8H7qrxFI437dSH1xWPtNSfHA=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771593267;
 b=P7ZuXURORX8W8aqKNI/R6xY3dDuv81Xh+Ub/ms2gVTmAbeOtLYj0Zeptp16WV6y0ljJDzwG/
 SCTo4deMZ1i1mcPy4MZ3VNPbUO2oIdsfw32aoAdOVJL3CVQSh9F1UNa7jyK7M6gSMM3OpVbJEUo
 jnQl3jN1ZkpkbWC+zDXWijJzQOpIn9DcZpkcU59I7RfYMhdAD6+zza3TBc9agQvFAIQEgee93/o
 4HU4MXxidz/0Pkn/GvyuvubM1+Wfy+hlEUb5DqJFCmaQ605/3QkRVRl1g/RoP4kDM9UMEZ2YTOo
 R8HnnBR8CWmkyJP5xipqDmukwLR6e6FksvGiaXsRXkPCg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771593267;
 b=s7SK397788yX9XxydBSvWYcx9zfNyTsB2+dMJMUfFEAbrDRzVR3d25p6lLRDtI3Bqq3/VW3e
 dLbePMFzmNbMNwkbIL8CB5Kl9/vS+THrkX4pTMHUgU9n305qQT2YMHtkk2h8a/A5BVglW7JN6OC
 K8P1X48f5YzNONMloR4pWEYQOhqkjrEHuFc51tZnqfh0HCt9JYiW+Xmb8zhR5mqKcKE4W3IRy6v
 sXb4i8V5zzH6eOwEMTrH2rJ5+itkwWhg9DrR8i2EBrSvhN5yE30IVuuNZRSA4mU6iGvz/HcArNv
 aQsOO1x7V8jARAflg3Xv76Bgu39e6bdD1RnH4ZsRUk1Mw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay48-hz3.antispameurope.com;
 Fri, 20 Feb 2026 14:14:26 +0100
Received: from [10.123.75.134] (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 0DBFDCC0E8B;
	Fri, 20 Feb 2026 14:14:15 +0100 (CET)
Message-ID: <d1a87e01-f887-44ad-9b95-08c0e29be6ee@ew.tq-group.com>
Date: Fri, 20 Feb 2026 14:14:14 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ARM: dts: imx6ul/imx6ull: add boot phase properties
From: Max Merchel <max.merchel@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>, Fabio Estevam <festevam@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux@ew.tq-group.com,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260218132339.32157-1-Max.Merchel@ew.tq-group.com>
 <20260218132339.32157-2-Max.Merchel@ew.tq-group.com>
 <CAOMZO5B5k_i_q4cd7SMNAkicF4WfEYNVUSrg8AamQHNpGys5mA@mail.gmail.com>
 <be39b302-a29b-4dcd-a3f1-1f3781476951@ew.tq-group.com>
Content-Language: en-US
In-Reply-To: <be39b302-a29b-4dcd-a3f1-1f3781476951@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:max.merchel@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: max.merchel@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay48-hz3.antispameurope.com with 4fHW1358Myz1kNt4C
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:7ee22832e241a6dc12898e584eefa700
X-cloud-security:scantime:2.706
DKIM-Signature: a=rsa-sha256;
 bh=2MjKH69EZTy6SNbmhiR8H7qrxFI437dSH1xWPtNSfHA=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771593266; v=1;
 b=oLvN8D/7ZxY8f7hnB712Sv75y7NOb/9jrG3W0YgPyiyP+ZZL3UP0xBu4Shjp0kxzuGUiFlSe
 Y9w/eCoF7PEuGS9AJ1JBEPbIshQaNoA/n086bh9v56/a198x538+cTy9LX6v8BxBZtWjfCr8pjb
 idWAIEiukYMBEgoOaDPwRCl2NG3NsNOqDVozygYB+gsNROYUrGnoTSjqMoGWptpyEMhG87z3AI4
 nht9mZELcPk6E9Zb+MMSK5CCJKCgSj9lSOiMKtNpd8G0v6NURsnAbmT4ulwW2pDmjQpHpi5Sk95
 o7sKOJLpaPYn6gSsjB6mkfTJRubBX4bqpj+4rfmpDIDJg==

Hi Frank,

I forgot the boot property for the spba-bus in imx6ul.dtsi.

If Fabio gives me feedback on my suggestion to improved the comment 
messages, I will send a V2 at the beginning of next week.

Am 20.02.26 um 13:10 schrieb Max Merchel:
> 
> 
> Am 18.02.26 um 19:14 schrieb Fabio Estevam:
>> Hi Max,
>>
>> On Wed, Feb 18, 2026 at 10:24 AM Max Merchel
>> <Max.Merchel@ew.tq-group.com> wrote:
>>>
>>> Add boot phase properties from U-Boot device tree.
>>
>> The commit logs of this series could be improved. Please take a look
>> at these examples:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ 
>> commit/?h=v6.19&id=256feb5be482315a91c1bd1a1808276f57ef76dd
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ 
>> commit/?h=v6.19&id=2285ea3f8065f47a6a1b62e6fcfa85105c8c261b
> 
> Hi Fabio,
> 
> I can add sentences to the commits, including the properties, for example:
> 
> dtschema/schemas/bootph.yaml describe various node usage during
> boot phases with DT.
> 
> All SoCs require buses (aips and spba), clock, iomuxc and SOC access 
> during boot process.
> 
> 

-- 
Best regards,
Max

TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
http://www.tq-group.com/


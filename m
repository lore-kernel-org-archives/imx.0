Received: from mx-relay90-hz2.antispameurope.com (mx-relay90-hz2.antispameurope.com [94.100.136.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAFA36C9F8
	for <imx@lists.linux.dev>; Tue,  3 Mar 2026 14:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.136.190
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772548684; cv=pass; b=pmhoHWzh9CnNe99nB0Wt2RSQleYw/Xp3oTggVfNWDN1/8Ggcju8ZOUCbAjgkRE9suILcbNIs/FInntWiLLlYVCyVcFEjTHTqU8ZWAAlxRoPInkgWt+xZ/su3kYp5REKCSQO+/KJs7oeBh6xtT2ulPWa6hm/D8CvcYZ0e+tHl7us=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772548684; c=relaxed/simple;
	bh=rVuybQUqazKyV8k4hcvo27/qV8xyidoXn7ChdP0vDYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XOXzMZbPKrG2Ij59R6JEG+sCV3fkRHyZhP7uYOq0n1Un48UyG3+re8Na0j+6WdKMQa1rLeqUclHrd52J3clvebyEMiRYnsEWmkIaMkzG/bkeOcooWn0pHzLQxWReDVWj5RhssB2DOskq7F0dT1qs4U0IKpYM/6r+o4tq8YfU7gk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=KAzYSg+Z; arc=pass smtp.client-ip=94.100.136.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="KAzYSg+Z"
ARC-Authentication-Results: i=1; mx-gate90-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=BtZl4GKtGgoXKB3Ht+zrsFdv8HOLRY0L6GMQM5yR7QM=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772548667;
 b=hqrds0FKLDv5eDHsOtf2QP5N+DmbdYTAQ/yC4HRanl9pD6jzC6PA77iJzvrw1Kba9G3ncID0
 j//SOPbJEHPeGJIZS5mTcmpGCQ+clpcxTgtXjNcaVAtUNNTnEaT57mZNnRSN2FKuaY70b5YwRRT
 njV+SrtkXci3NgNKoH2ilF0y7I2anSn4QEml+E82g4nhAm2jEXFS6z5Jv1uu+FIylSGlyDzvGHU
 u3XuBWE1IJBpiqhE8xFwvN9n375RiuSRJwD/CFuXLdVecyp2obOJIC3R0CH4mlUdyMVHw0VqXUe
 ITRmnJzvTokBEjKM75C7bRzoSknXOrNtP6vuyLCczpA5A==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772548667;
 b=ZJ16sUo2ThmB5ZQMy9arPUmetzA01O7gm9kfG++xkeZWvdFHlo+oBO+JjOlHakJ09BrFCoWG
 bIO4dTUEn7i/BkoN15vSuEk5MGWy8TIz33X88SJz4I5ThWrwjkGrMfeW44zulu+SJiVoI/bplXJ
 Rp3vpfeCtYc3nnPFy2T/ygci4JF4h9AFyZro676ZO2PYt7IsMei3+8FmTCsCgnQuoH+f9iHAYPR
 X0Yr5ZrDZBlzc37hHYviWvtoadxA3Y5vmyja3NyQCfHJhnZ9HAkkWfCS8IQI5w28SelsK0OKuh/
 gtIIhe2luoKx/kINgEzWMDOdYFuFhrjgslVFqGMaWJFRQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay90-hz2.antispameurope.com;
 Tue, 03 Mar 2026 15:37:47 +0100
Received: from [10.123.75.134] (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id DFBB7A4079E;
	Tue,  3 Mar 2026 15:37:40 +0100 (CET)
Message-ID: <113446c6-3b1c-457d-a29b-682cdc9e5577@ew.tq-group.com>
Date: Tue, 3 Mar 2026 15:37:40 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] ARM: dts: TQMa6: modify for use in bootloaders
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux@ew.tq-group.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260220143008.186851-1-Max.Merchel@ew.tq-group.com>
Content-Language: en-US
From: Max Merchel <max.merchel@ew.tq-group.com>
In-Reply-To: <20260220143008.186851-1-Max.Merchel@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:max.merchel@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: max.merchel@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay90-hz2.antispameurope.com with 4fQJLF4WpFzX1Yg
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:9fd46e5f27eaa805456295327e3d5223
X-cloud-security:scantime:1.206
DKIM-Signature: a=rsa-sha256;
 bh=BtZl4GKtGgoXKB3Ht+zrsFdv8HOLRY0L6GMQM5yR7QM=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772548667; v=1;
 b=KAzYSg+ZV+xUt0fZhjr1tod9fmZs0Kkq2DjNO24h2qexBqC2ostfTnREWHSmlazIi2tEcNno
 2487PE1O6ijfvudmygwOSgqw0kgDkbpFmBlqdkusVw2vjZpIKGKhzKSvFNKW4DMj1TmJ2wcrAL1
 HWewsbLm+zgUe5XcyJVmhimBGtzS2wB6r7fymcrhEeLK3qExzjilqPYYyrXq39rj0MNqgX5MKID
 iBf9QircBVAw27iRUYmst3P0JWY2GQY/qIO8HHjLRMv1SlL2PFBGkRK/oXUx8s2s55Kv3F4UtCm
 ax1B0NiZ7Oygxo2BvLVszyjezA5exvJ34dB1Jt0q748CQ==


Am 20.02.26 um 15:30 schrieb Max Merchel:
> This series contains modifications for using Linux device trees
> in bootloaders. Changes from U-Boot bootloader are incorporated
> directly into the Linux device trees.
> 
> Changes in v2:
> Improved commit messages for commits that add boot-phase properties.
> 
> Max Merchel (4):
>    ARM: dts: imx6qdl-tqma6: add missing labels
>    ARM: dts: imx6qdl: add boot phase properties
>    ARM: dts: imx6qdl-tqma6: add boot phase properties
>    ARM: dts: imx6qdl-mba6: add boot phase properties
> 
>   arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi   | 12 ++++++++++++
>   arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi  | 11 +++++++++++
>   arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi |  5 +++--
>   arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi |  6 ++++--
>   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi        |  6 ++++++
>   5 files changed, 36 insertions(+), 4 deletions(-)
> 

Any further feedback on this?

-- 
Best regards,
Max

TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
http://www.tq-group.com/


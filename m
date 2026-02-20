Received: from mx-relay10-hz2.antispameurope.com (mx-relay10-hz2.antispameurope.com [83.246.65.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D97155C87
	for <imx@lists.linux.dev>; Fri, 20 Feb 2026 12:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=83.246.65.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771589527; cv=pass; b=a1KNRshjkPVrcJYNfGEaRQgzveKufIc3B6MdfCQD/N6lmJHoSmZ61V5p413trV4PX/QPN/rCSZW3VAgbetA8mIWoLYE+/H0FWWWYnhtCt3zT3gpX4Ftr/C23nsQNDNudnOY0vJifUYqPyb96rG+I0SStQJctnqGQ3AFAA4b2rxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771589527; c=relaxed/simple;
	bh=3jSdrfj2eKFqoMZBF1XMq/DvR8ejwwKX90MQN/7vRKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fl+k8DZq+t8/TLbLBq9ucQcAmqBevyBj2AzORPT7HCU0hyXJI8p9AIO8NGnGAkkZ5vki3554zlcoWiP+7CQMIWXPPhk8FuJIfS7WqjG11rGca9/w2S4+OPtH4mja/JYlFDAsVm4bfpWDkqCkTUdzG0U3fo5HePWUieoEvPv4cMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=r0vlAt0J; arc=pass smtp.client-ip=83.246.65.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="r0vlAt0J"
ARC-Authentication-Results: i=1; mx-gate10-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=Y8euMMd7ovn1uCyxnqZ+G2FrrL0KvzYCdQUy11Pfe3E=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771589441;
 b=ipTkeEamnCnjoe5ys+oW/F+CstjtUKc5emj3m6GMPjkusRQgUO7uMHkBK3GtxdtHkmHJQKn6
 /bpBPgZhWVspdXI2CLhMCQCrf46J7PaB+NuzPmRDxcZ5+lLITeGIF3tn/W1wOJsfHxEvyuM4Qws
 GbwQ0N0dXIOkCa/QOWEGOaSs3QkMd4Jr+uCoxBcjobOU18D+qEhcV8l0+yFK7lMSTEFcP8fR/UO
 FeEbTS30atpgyXAbfiZEByRZjA8GF7QzNX7t5tGYbiUoF10VrwG/e/ZySgEYkiULc2ua1CYe5xV
 rmG+o1OfZuJiwfPNoNZG4VyAjgCf5/IhH7NBZNJ/WBduw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771589441;
 b=HnXWYCJSuD15mkEQ0ZMxEAzQGxTR1OjwxZwD3oYU8zQ4BHXNAQqH/rmxsAOHl9QArkqrD2qy
 RVzUeJS2qs0ZE9AFS8PTsfn2hI25eWiFG/6PsjL2XWwTqUBKSzj0biVhZ1mDzHtHPIjVu0Uij1h
 qhsSvxrvZtteZeVB39xm3C1wnuty1rpQBg3IgqZEScnK3APggjf24eAORwtd2+fX1IVE1QvTtxN
 xLl6y2bmc+fdN7tgwUFqOl6G4jUcAqBTDeGlG0Psnw9ceV3j8SDomhKSs4kL/SHjTQvpW1esqI+
 vwgKxUs8KMP3ujxw+ibqByY87T8KIiDdF67CfJEpgMRHw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay10-hz2.antispameurope.com;
 Fri, 20 Feb 2026 13:10:41 +0100
Received: from [10.123.75.134] (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id ADD93CC0CB6;
	Fri, 20 Feb 2026 13:10:23 +0100 (CET)
Message-ID: <be39b302-a29b-4dcd-a3f1-1f3781476951@ew.tq-group.com>
Date: Fri, 20 Feb 2026 13:10:22 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ARM: dts: imx6ul/imx6ull: add boot phase properties
To: Fabio Estevam <festevam@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux@ew.tq-group.com,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260218132339.32157-1-Max.Merchel@ew.tq-group.com>
 <20260218132339.32157-2-Max.Merchel@ew.tq-group.com>
 <CAOMZO5B5k_i_q4cd7SMNAkicF4WfEYNVUSrg8AamQHNpGys5mA@mail.gmail.com>
Content-Language: en-US
From: Max Merchel <max.merchel@ew.tq-group.com>
In-Reply-To: <CAOMZO5B5k_i_q4cd7SMNAkicF4WfEYNVUSrg8AamQHNpGys5mA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:max.merchel@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: max.merchel@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay10-hz2.antispameurope.com with 4fHTbN2hRzz4FJRR
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:ecebb1631c20b4aa5b2d1e856db1193a
X-cloud-security:scantime:5.080
DKIM-Signature: a=rsa-sha256;
 bh=Y8euMMd7ovn1uCyxnqZ+G2FrrL0KvzYCdQUy11Pfe3E=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771589440; v=1;
 b=r0vlAt0JLrYnjtH6SK53eGmZQAfMd3x4BLjDCJuGjUv2WlH1DD1993ppE6Agt+PXJ+8ZT6bB
 6H1wTlUl1Ok0c/xjcxdJYIIJZYmLx+QGkn2HZZUWDdgxKZLg41GUU2niNUdxmhnPkxKnZIiyvTQ
 xsYxKPabv5f85OOCBdZ2nWdtbhrnzU06zduL0792Vm8RTsNM5Q98ePV0arLKY8vQuTA1GeaUSP5
 4t8B5+3QXnFuvwMoYDkvUWgkKPOHHdSySQoW1KxqxgFytRR+w/YY8Bs07cFL//NlkJRfZwKA1+6
 Inm8zqlsEhRsVGd8pd3GtI4Yc09CrwQ0Xbz+vt4rBofOA==



Am 18.02.26 um 19:14 schrieb Fabio Estevam:
> Hi Max,
> 
> On Wed, Feb 18, 2026 at 10:24 AM Max Merchel
> <Max.Merchel@ew.tq-group.com> wrote:
>>
>> Add boot phase properties from U-Boot device tree.
> 
> The commit logs of this series could be improved. Please take a look
> at these examples:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v6.19&id=256feb5be482315a91c1bd1a1808276f57ef76dd
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v6.19&id=2285ea3f8065f47a6a1b62e6fcfa85105c8c261b

Hi Fabio,

I can add sentences to the commits, including the properties, for example:

dtschema/schemas/bootph.yaml describe various node usage during
boot phases with DT.

All SoCs require buses (aips and spba), clock, iomuxc and SOC access 
during boot process.


-- 
Best regards,
Max

TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
http://www.tq-group.com/


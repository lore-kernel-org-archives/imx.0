Received: from mx-relay32-hz1.antispameurope.com (mx-relay32-hz1.antispameurope.com [94.100.133.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61694301CC
	for <imx@lists.linux.dev>; Tue,  3 Mar 2026 14:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.133.208
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772548745; cv=pass; b=Siiv9ZKpm9z8h4rxkgxanALAWhRUwAVIvLzlum7j2rNa21Imz2gJluDsisRxPUVuBCO1/Gp27lshAZr2IWI6KvlN1+QEfL71vB6e54+UwRoyFcFbMLFr/il+uCYQhQWMybjYwKlfd6IMrW1+9x6F54TDuDspEATBAhnYu1bFveY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772548745; c=relaxed/simple;
	bh=qnO7IRr0LlEJaNRBAGoo2LWcIhj9SGvdD+DC52MgbfA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZAKEQzVycE6TstHEiteTGRshRNIhUqNvpP0/dTK1FOuuCp1ZuteaojWfXcD/1j+EtS4eivWS56CEGQ1pFxw/i9eft5yzlD2a3DcDCAAoKxff94+DLgtQwwEcdrDpoUZgMo3JcVrYpZecJNNHDoBWOkf/VludVB2vvREI24aQhxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=mXNO3bJs; arc=pass smtp.client-ip=94.100.133.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="mXNO3bJs"
ARC-Authentication-Results: i=1; mx-gate32-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=zT632VR0gROFa3F9kvU2rdhPuRa8nKqiAx8K/kUtGPY=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772548682;
 b=bs6hmyl9Q7XqfYKVT8T2JP51V9nDnQyvzMJEqvIBSwI+H91sO32AnB+53+uqiRQPIb2NJRzq
 7wKGrqYKh5deP629nz0SuyBIN45KuCDiAbvwR6VT+YZBjtFABiFPs1opqahFeTHxjxGHhczhTK9
 sBIKhFm17IsN27EFNi3bC2SK5nfnxannB7fsQvJZnYcJx/mXt6ho/J6wxD4fKSC0iPix7TFHGDw
 Bh0VfW3k2OtJjIwKABMMsv3zSKRBAlcyHb4kcgaVy1cESl15CkUksfLn2xsbA8BzVCsLjDZawVK
 9Vjyxd6RceS6WDdrlx/++tjrA1AsijwXkU6Hby5B6aDDg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772548682;
 b=rDxDuJEETfFXJDDu3KPhX8cqt20iC7YuF7+58s/3dxNxX0PMpDVhohNEKqxdZ1OT4EBYpx15
 cFdBoWSmG8ZA/LFK6FB1T1//b4PGdUClM9kZ9gqg5yN/QvQbDM6DB7ipzUYe/H/YmlVeus1kShL
 dJOUCnwGgUtDYL6BBzGr56nVKy7dXUZ6rABGqy1JwTWrigIhRhPX6zPC7FZMdfKKpfvOP/A0SEz
 MnbDDQfkPKGHmy8dZlnrUG5R1h+z01jITh6LTICYPcWVvSDYRb/gwWq7nRhCi6U09RFoKGkB4XM
 R9Ewj280mCceQUy3NHqKXXdoxg/Ia0XD4yjzGmoEy8iaA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay32-hz1.antispameurope.com;
 Tue, 03 Mar 2026 15:38:02 +0100
Received: from [10.123.75.134] (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id A5C73CC0E07;
	Tue,  3 Mar 2026 15:37:53 +0100 (CET)
Message-ID: <ac506790-fbe4-4902-895a-a94822f11b39@ew.tq-group.com>
Date: Tue, 3 Mar 2026 15:37:53 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] ARM: dts: TQMa6UL: modify for use in bootloaders
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux@ew.tq-group.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260220143107.186956-1-Max.Merchel@ew.tq-group.com>
Content-Language: en-US
From: Max Merchel <max.merchel@ew.tq-group.com>
In-Reply-To: <20260220143107.186956-1-Max.Merchel@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:max.merchel@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: max.merchel@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay32-hz1.antispameurope.com with 4fQJLV27Cgz9022
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:f0f40d72e89aaf42e08c864d0bda316f
X-cloud-security:scantime:1.450
DKIM-Signature: a=rsa-sha256;
 bh=zT632VR0gROFa3F9kvU2rdhPuRa8nKqiAx8K/kUtGPY=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772548681; v=1;
 b=mXNO3bJsrMAbnskKKmA0iUZYfwCLit2EtXjs5wJusAYgTWebormbl7jOKNXRm9DNHoL3ovch
 07waEVtmfTYDY+Aize3LreD5x+1HSK9GopL4TpSkivtb5jVGob0q6FdUd7YekIYOJIyuyjbnebp
 JlqHiwy4JIPAaxda+WFaYo0D3MaYi/cMijKRrP0ZnbIXPLGNFkLmLzswZlIcOPKKpTsutG97V9X
 0jDhYe/H8CEs/ORdUpFQC0hEFhFVoy1HTfyFFNAou/HRTnc4CIkts/vF9XOmcRvO3CKDXPsDIt0
 ss1vzCp4nhGLwE5YqXF+eMrke8Dvu+TBmjQ7pR6ME90nQ==


Am 20.02.26 um 15:31 schrieb Max Merchel:
> This series contains modifications for using Linux device trees
> in bootloaders. Changes from U-Boot bootloader are incorporated
> directly into the Linux device trees.
> 
> Changes in v2:
> Improved commit messages for commits that add boot-phase properties.
> Add forgotten boot property for the spba-bus in imx6ul.dtsi.
> 
> Max Merchel (4):
>    ARM: dts: imx6ul/imx6ull: add boot phase properties
>    ARM: dts: imx6ul[l]-tqma6ul[l]: add boot phase properties
>    ARM: dts: mba6ulx: add boot phase properties
>    ARM: dts: tqma6ul[l]: correct spelling of TQ-Systems
> 
>   arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi   | 10 ++++++++++
>   arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2.dtsi         |  1 +
>   arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2l-mba6ulx.dts |  4 ++--
>   arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2l.dtsi        |  1 +
>   arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulx-common.dtsi  |  1 +
>   arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulxl-common.dtsi |  1 +
>   arch/arm/boot/dts/nxp/imx/imx6ul.dtsi                  |  7 +++++++
>   arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2.dtsi       |  1 +
>   .../boot/dts/nxp/imx/imx6ull-tqma6ull2l-mba6ulx.dts    |  2 +-
>   arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l.dtsi      |  3 ++-
>   arch/arm/boot/dts/nxp/imx/imx6ull.dtsi                 |  1 +
>   arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi                 |  6 ++++++
>   12 files changed, 34 insertions(+), 4 deletions(-)
> 

Any further feedback on this?

-- 
Best regards,
Max

TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
http://www.tq-group.com/


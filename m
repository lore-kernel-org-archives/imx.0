Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5241400C;
	Thu, 12 Mar 2026 15:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773328017; cv=none; b=pGMnFyCM+axuHOrEWXIcXOzCffDMK5sxl2v9f0hnc3UsNTY7RcCeyN5P3gjT9aIfnzu6ASHkCKfFFlmq7daut8mBJfhl6+MFlv74tH/PmHYzLfLb9yuiP7yVOBR0D74oaT/alKMKQKzAfmuzDPGm/18d+1YYmHhEXTSdiYQvmfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773328017; c=relaxed/simple;
	bh=R8Q3WvA5Ic7yjTt+iAM2be7pTSy6TJQu1++F2S4PhYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lIz9ikVQgXhIM4g1VGk8H73PQsMOz8+sHTjW90HRWIXe+rhcW+gbrRJ04MhUHPGH3yFVzR/O+zVNupqZIhNsFCjvW/nGciauXkmxSN0bfOO0qM4JXgiG8ampZj1SqtItSXXXBbMJzYtdoYlbwEG3uhZL/nYUZyc2N0YVphAAKLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=c/D2t2/V; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="c/D2t2/V"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=0jWlLUSeN29Pq02QcM+6J989J3yKVwQy0x52kUrHLWk=; b=c/D2t2/VpkFqdXBjHh3Pe4TtEP
	lxbnyWJAJ4/jjMZ6vl2/qlH+G+HkKTgsVbREd8BEzHTPWqEYU2GJ1M8nK2RIhyGXXdQgmE3pmpe9M
	ayL5NlNrX10feY2yxK0ptjPT1yNnzqUNwTPLMn/eL3q91uNWpPLFq9aVEd2iQ4ub6ymTJoTdsNLKF
	/pg5QgHwaLpniRJjcCrW/HDIbxIzz3/dA4EourHP97dOZWEXbng1vKd3ZAalt21rb4gXYrfAkdMqJ
	IP3Ig/SQW2KeK2YHQx1Es5Pj053TC6tSohzFWr5YUmx3WmRdJUGswr62ri3GHcrthfmFzAKoBVXu1
	W4d+K4Eg==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <max.merchel@ew.tq-group.com>)
	id 1w0hMP-000JL7-2a;
	Thu, 12 Mar 2026 15:50:01 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <max.merchel@ew.tq-group.com>)
	id 1w0hMP-000AiT-0Z;
	Thu, 12 Mar 2026 15:50:01 +0100
Message-ID: <e9c0606c-82e7-4979-a6a4-efea6a570009@ew.tq-group.com>
Date: Thu, 12 Mar 2026 15:50:00 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] ARM: dts: imx7d: Use undeprecated reset-gpios
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Marek Vasut <marex@denx.de>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@dh-electronics.com, linux@ew.tq-group.com
References: <20260311-dts-snps-reset-gpios-v1-0-ea1cc09fba84@oss.qualcomm.com>
 <20260311-dts-snps-reset-gpios-v1-6-ea1cc09fba84@oss.qualcomm.com>
Content-Language: en-US
From: Max Merchel <max.merchel@ew.tq-group.com>
In-Reply-To: <20260311-dts-snps-reset-gpios-v1-6-ea1cc09fba84@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27938/Thu Mar 12 07:24:01 2026)


On 3/11/26 17:08, Krzysztof Kozlowski wrote:
> Freescale i.MX6 PCIe host controller bindings through referenced
should be i.MX7
> snps,dw-pcie-common.yaml schema already document "reset-gpios", just
> like Linux kernel did for a long time.  Use the preferred form over
> "reset-gpio" deprecated since commit 42694f9f6407 ("dt-bindings: PCI:
> add snps,dw-pcie.yaml") in 2021.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts | 2 +-
>   arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts  | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts b/arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts
> index e3ee16f1aaa9..a5fc7f80f651 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts
> @@ -122,7 +122,7 @@ &pcie {
>   	/* 1.5V logically from 3.3V */
>   	/* probe deferral not supported */
>   	/* pcie-bus-supply = <&reg_mpcie_1v5>; */
> -	reset-gpio = <&gpio5 12 GPIO_ACTIVE_LOW>;
> +	reset-gpios = <&gpio5 12 GPIO_ACTIVE_LOW>;
>   	status = "disabled";
>   };
>   
> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts b/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts
> index a370e868cafe..ab7cabe5552d 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts
> @@ -456,7 +456,7 @@ display_out: endpoint {
>   };
>   
>   &pcie {
> -	reset-gpio = <&extended_io 1 GPIO_ACTIVE_LOW>;
> +	reset-gpios = <&extended_io 1 GPIO_ACTIVE_LOW>;
>   	status = "okay";
>   };
>   
>
-- 
Best regards,
Max

TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
http://www.tq-group.com/


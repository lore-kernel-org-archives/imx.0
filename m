Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AB8F9D6;
	Fri, 27 Dec 2024 15:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735312737; cv=none; b=HLSpIKQESnfg7tJoIvXBtY6ZetilB5YVVqc+NGgjnlxv4uc0xwWN2xgzrwT8HloggqKuuRSDWs624JIyDP04H30U99hKos0TIbwYW+5FbYRx7WWYs2iMimezpCUBJtgMlL2y4w5v3QUWCQ+C8ilIWlJSXJtGTrMizHxCQegmu6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735312737; c=relaxed/simple;
	bh=TecfYovZ6nU0ZbJdXO5WWSnJJ+xeXIYM70+2gZINR5A=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Hs51LF+umstuq3g9EB4aI8Eaqcr0hGJkPNyq+05oda2jH1DChQZUU1bbx6Qc85Xeg5MMmiVNuvfEOexIe20j4yA5gYJ7L5fPFTt6c5Hl3UBDIXN/1Gzo8r8klMr8lDBBebtVObDe72PlkSoahgiapy7EeCq3ncvSkU8EiJ/P49M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FJ9ai8QF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FJ9ai8QF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEDF7C4CED0;
	Fri, 27 Dec 2024 15:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735312737;
	bh=TecfYovZ6nU0ZbJdXO5WWSnJJ+xeXIYM70+2gZINR5A=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=FJ9ai8QFN8/H30uRZEWlmqWuSonhow5tSiRAPqUIVsiuxGbQ+jhlqp20bMlDN3o0w
	 raAyGmCKGqKOPp2YmIrlWMQI/qIzLhRSkxfZbhHjnczg3lkRYsomNAfE4AWsM9209b
	 NroJl1LQUfURNu+72iXZ35TjMv358pEegNloKHT21oEI9Y1JHczcH99TxH5vgvBvSM
	 qf44SbhkstcpSnOCNqN/rpu/t5GKmWV1f4a4k2/EKYq6YHv5Z5cjpdJHKGQdz4LwRY
	 tbt4T/5Rq4qlTwmnf3Rmb1KAnKV1rJ8G2/utKXo2MKMtl2zG3fWlgyPJzXAHyZQpwG
	 UJpMr2NnLUOug==
Date: Fri, 27 Dec 2024 09:18:55 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
To: Marek Vasut <marex@denx.de>
In-Reply-To: <20241226171404.84095-1-marex@denx.de>
References: <20241226171404.84095-1-marex@denx.de>
Message-Id: <173531253398.3886481.9345779510218290682.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8mp: Update Data Modul i.MX8M Plus eDM
 SBC DT to rev.903


On Thu, 26 Dec 2024 18:13:27 +0100, Marek Vasut wrote:
> Update the DT to match newest Data Modul i.MX8M Plus eDM SBC rev.903
> board which implements significant changes. Keep some of the rev.900
> and rev.902 nodes in the DT so that a DTO can be used to support old
> rev.900 and rev.902 boards easily.
> 
> The changes from rev.900 to rev.902 are:
> - Both ethernet PHYs replaced from AR8031 to BCM54213PE
> - Both ethernet PHYs MDIO address changed
> - PCIe WiFi now comes with dedicated regulator
> - I2C TPM chip address
> - Additional GPIO expander for LVDS panel control added
> - Current EEPROM I2C address changed
> - Another optional EEPROM added onto another I2C bus
> 
> The changes from rev.902 to rev.903 are:
> - Additional GPIO expander for WiFi and LVDS panel control added
> - Multiple GPIOs are reassigned
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  .../freescale/imx8mp-data-modul-edm-sbc.dts   | 147 +++++++++++++++---
>  1 file changed, 128 insertions(+), 19 deletions(-)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y freescale/imx8mp-data-modul-edm-sbc.dtb' for 20241226171404.84095-1-marex@denx.de:

arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: tpm@2e: compatible: 'oneOf' conditional failed, one must be fixed:
	['st,st33tphf2ei2c', 'tcg,tpm-tis-i2c'] is too long
	'st,st33tphf2ei2c' is not one of ['infineon,slb9673', 'nuvoton,npct75x', 'st,st33ktpm2xi2c']
	'st,st33tphf2ei2c' is not one of ['atmel,at97sc3204t', 'infineon,slb9635tt', 'infineon,slb9645tt', 'infineon,tpm_i2c_infineon', 'nuvoton,npct501', 'nuvoton,npct601', 'st,st33zp24-i2c', 'winbond,wpct301']
	from schema $id: http://devicetree.org/schemas/tpm/tcg,tpm-tis-i2c.yaml#
arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: tpm@2e: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/tpm/tcg,tpm-tis-i2c.yaml#
arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: /soc@0/bus@30800000/i2c@30a20000/tpm@2e: failed to match any schema with compatible: ['st,st33tphf2ei2c', 'tcg,tpm-tis-i2c']
arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: rtc@68: #clock-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/rtc/st,m41t80.yaml#
arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: rtc@68: Unevaluated properties are not allowed ('#clock-cells' was unexpected)
	from schema $id: http://devicetree.org/schemas/rtc/st,m41t80.yaml#






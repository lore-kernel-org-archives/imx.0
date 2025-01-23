Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E9D2144A6;
	Thu, 23 Jan 2025 15:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737647870; cv=none; b=u47h4V3DyPMrSvYCGSvpGwrZOPN/MosP7KLUlN/tqfxmiFm9QT9ZWyhAoLXQd2QUhUyCgi2yLCADqwLLmrdXLTyMjlhYaycT2j9gv3XAU+duwQ0t0ePkKdcwlCbs+s1sFiNblOd7tBn4E1mnjb871FF5/hyr408Xpof4CqXlJFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737647870; c=relaxed/simple;
	bh=ft8Jievp9zLCcxslQvNCpMJJr771yq6XaBBtLD9kMvU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=a/ctS/gc61nxXV5odYrIXQAGV1xYySjD6yG4P3d8H1pT4QtTCuoc8k4fkqEd/OQZAz8o78o9IMUeZgj7q9EONknrDMHG4Cws54zGLLWNqqPAWddEi10CwMuW87Vf2clLWH8ZOHO9VvnYP/MRfBeHxPl1hncZkWPvKGzMVqAMWMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SmlWiEJk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SmlWiEJk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 448B5C4CED3;
	Thu, 23 Jan 2025 15:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737647869;
	bh=ft8Jievp9zLCcxslQvNCpMJJr771yq6XaBBtLD9kMvU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=SmlWiEJkChX33WESinpqu8F9rIKOPOsZrPOKeRT8AI3FAIwHcs/Cq9WEwL+8OFWPP
	 QJJ8ME5QD7b3+2zJ8OgtZyxnEDMRW2tmBoBPTuLGAOJkj2P7IQ90YClw78IuOfVzYc
	 gWfgDx59pmvU4wTwDirmvNXVPy707RS/T+wj+w89+ej44ABbKEaWPC3YYqFaF2OhNB
	 36aLbERTs2BlZ9H+hBvKIEYPowS0w/eb7KQRMfKKvdtLB7O17ophpFsK63ra8icoy5
	 8fukKhT+59r0qYfsp6SiEF60Yt66KhSkV6R6TPyNdPRb0N+1pRRrWUoYz0jVlIvVFk
	 fVIPSVDfjKLZg==
Date: Thu, 23 Jan 2025 09:57:48 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, 
 devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, imx@lists.linux.dev
To: Antonin Godard <antonin.godard@bootlin.com>
In-Reply-To: <20250121-varsom6ul-concerto-dts-v1-0-eb349acf0ac6@bootlin.com>
References: <20250121-varsom6ul-concerto-dts-v1-0-eb349acf0ac6@bootlin.com>
Message-Id: <173764775251.3793618.182783828690702678.robh@kernel.org>
Subject: Re: [PATCH 0/3] Add Variscite i.MX6UL SoM and Concerto board
 support


On Tue, 21 Jan 2025 10:33:26 +0100, Antonin Godard wrote:
> This patch series adds support for the i.MX6UL Variscite SoM
> (VAR-SOM-6UL) and the Variscite Concerto Carrier Board.
> 
> I tested this with a VAR-SOM-6UL_G2_700C_512R_8N_IT_REV1.3A (one variant
> of this SoM), meaning I couldn't test all of the possible options of the
> SoM - so this device tree includes partial support for it.
> 
> These are based on the 5.15 Variscite kernel fork but adapted for
> mainline.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> Antonin Godard (3):
>       dt-bindings: arm: fsl: Add VAR-SOM-MX6UL SoM and Concerto board
>       ARM: dts: imx6ul: Add Variscite VAR-SOM-MX6UL SoM support
>       ARM: dts: imx6ul: Add Variscite Concerto board support
> 
>  Documentation/devicetree/bindings/arm/fsl.yaml     |   6 +
>  arch/arm/boot/dts/nxp/imx/Makefile                 |   1 +
>  .../boot/dts/nxp/imx/imx6ul-var-som-concerto.dts   | 331 +++++++++++++++++++++
>  arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi      | 232 +++++++++++++++
>  4 files changed, 570 insertions(+)
> ---
> base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
> change-id: 20250120-varsom6ul-concerto-dts-a08be2a6219b
> 
> Best regards,
> --
> Antonin Godard <antonin.godard@bootlin.com>
> 
> 
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


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/nxp/' for 20250121-varsom6ul-concerto-dts-v1-0-eb349acf0ac6@bootlin.com:

arch/arm/boot/dts/nxp/imx/imx6dl-b125v2.dtb: clock-controller@20c4000: clocks: [[23]] is too short
	from schema $id: http://devicetree.org/schemas/clock/imx6q-clock.yaml#






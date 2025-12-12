Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4F21D5CE0;
	Fri, 12 Dec 2025 14:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765550380; cv=none; b=vGupI9S+uXRVi2XDboX5XmVK5DhwEz9qPVJxfmAuIDuTA+kbdXOqVcJ1LW6J6mMZYpJKGdJYPqFgpQxLeVBrc8ToioX/+d6dH6qD24hMblbfvbkGDNMUbh2nZNqYxUBBsz7T6nbRVxMt6fsPd3SUkFzpWqgFpPZ91pJ/Bs7xBMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765550380; c=relaxed/simple;
	bh=3EmwO7Bq0UqpSDbd6eBgd6cz4gcTCrfg7hJidyqNd0Y=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=mN0638OjIzkhxGccS7p9ExOR3ZnG3Du+KWv5aEvWzsczTP6mXh6/b6soQWb3w7aO6dmdor/nzo5ZJwPG3VHV8UJjd4R7rSjndvztD91AeEPkPBveXktX9yZfqzalKtKVMYUzZO1I/oVcZkA/uRyjEeheAkWaD4e7aVIWQ6YIjXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XW2up1rk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XW2up1rk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FA1EC4CEF1;
	Fri, 12 Dec 2025 14:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765550380;
	bh=3EmwO7Bq0UqpSDbd6eBgd6cz4gcTCrfg7hJidyqNd0Y=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=XW2up1rkD3d5pXFY2oGfvCh6DRlQ+VsUMwayTygrIsC6QmTKgGBwsNLM7oq4PGou8
	 VIXlmvHQcuHFfQHS36e0p04gC7hOVxli+kyNbwdFgzIQOzy4Zasi2aPK/u5tMjBiii
	 7k5nwqet4wLa2Fzn0u34YmTf4K72g7k8YUvYznldK90RwS8jRxovKJ9U045t4+TivT
	 VK5woIL3ClboBJrmkm3enQfP+CnasRUC0peP3JD4u2KHm7JNZL1q/2naWkuhSKqAwH
	 nQdTqNVv4CVSP+TceAJN5IVvcDFICltUcLhcBOqbhCB5TvFAzUdJeSZASK4FuQfx4Z
	 GRK/hMMR8TLow==
From: Rob Herring <robh@kernel.org>
Date: Fri, 12 Dec 2025 08:39:36 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <frank.li@nxp.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
In-Reply-To: <20251212-imx91-dts-v1-0-2bb3c13762dd@nxp.com>
References: <20251212-imx91-dts-v1-0-2bb3c13762dd@nxp.com>
Message-Id: <176555030606.3954208.10492221378451090067.robh@kernel.org>
Subject: Re: [PATCH 0/4] arm64: dts: imx91: misc updates


On Fri, 12 Dec 2025 17:16:06 +0800, Peng Fan (OSS) wrote:
> Patch 1,2: add temp sensor and thermal zone
> Patch 3: Update file name
> Patch 4: Add gpio4 alias
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Peng Fan (4):
>       arm64: dts: imx91: Add tempsensor node
>       arm64: dts: imx91: Add thermal zone node
>       arm64: dts: imx91: Update file name with dash
>       arm64: dts: imx91-11x11-evk: Add gpio4 alias
> 
>  arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts  |    1 +
>  arch/arm64/boot/dts/freescale/imx91.dtsi           |   58 +-
>  arch/arm64/boot/dts/freescale/imx91_93_common.dtsi | 1187 --------------------
>  arch/arm64/boot/dts/freescale/imx93.dtsi           |    2 +-
>  4 files changed, 59 insertions(+), 1189 deletions(-)
> ---
> base-commit: 008d3547aae5bc86fac3eda317489169c3fda112
> change-id: 20251212-imx91-dts-8d2e483191f7
> 
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
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


This patch series was applied (using b4) to base:
 Base: 008d3547aae5bc86fac3eda317489169c3fda112 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20251212-imx91-dts-v1-0-2bb3c13762dd@nxp.com:

In file included from arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts:9:
arch/arm64/boot/dts/freescale/imx93.dtsi:6:10: fatal error: imx91-93-common.dtsi: No such file or directory
    6 | #include "imx91-93-common.dtsi"
      |          ^~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.dtbs:141: arch/arm64/boot/dts/freescale/imx93-14x14-evk.dtb] Error 1
make[2]: *** [scripts/Makefile.build:556: arch/arm64/boot/dts/freescale] Error 2
make[2]: Target 'arch/arm64/boot/dts/freescale/imx93-14x14-evk.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1512: freescale/imx93-14x14-evk.dtb] Error 2
In file included from arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi:8,
                 from arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts:15:
arch/arm64/boot/dts/freescale/imx93.dtsi:6:10: fatal error: imx91-93-common.dtsi: No such file or directory
    6 | #include "imx91-93-common.dtsi"
      |          ^~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
In file included from arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts:9:
arch/arm64/boot/dts/freescale/imx93.dtsi:6:10: fatal error: imx91-93-common.dtsi: No such file or directory
    6 | #include "imx91-93-common.dtsi"
      |          ^~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.dtbs:141: arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dtb] Error 1
make[3]: *** [scripts/Makefile.dtbs:141: arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dtb] Error 1
make[2]: *** [scripts/Makefile.build:556: arch/arm64/boot/dts/freescale] Error 2
make[2]: Target 'arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dtb' not remade because of errors.
make[2]: *** [scripts/Makefile.build:556: arch/arm64/boot/dts/freescale] Error 2
make[2]: Target 'arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1512: freescale/imx93-tqma9352-mba93xxca.dtb] Error 2
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1512: freescale/imx93-9x9-qsb.dtb] Error 2
In file included from arch/arm64/boot/dts/freescale/imx93-var-som.dtsi:9,
                 from arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts:10:
arch/arm64/boot/dts/freescale/imx93.dtsi:6:10: fatal error: imx91-93-common.dtsi: No such file or directory
    6 | #include "imx91-93-common.dtsi"
      |          ^~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.dtbs:141: arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dtb] Error 1
make[2]: *** [scripts/Makefile.build:556: arch/arm64/boot/dts/freescale] Error 2
make[2]: Target 'arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1512: freescale/imx93-var-som-symphony.dtb] Error 2
In file included from arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi:8,
                 from arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts:15:
arch/arm64/boot/dts/freescale/imx93.dtsi:6:10: fatal error: imx91-93-common.dtsi: No such file or directory
    6 | #include "imx91-93-common.dtsi"
      |          ^~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.dtbs:141: arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dtb] Error 1
make[2]: *** [scripts/Makefile.build:556: arch/arm64/boot/dts/freescale] Error 2
make[2]: Target 'arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1512: freescale/imx93-tqma9352-mba91xxca.dtb] Error 2
In file included from arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi:9,
                 from arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dts:15:
arch/arm64/boot/dts/freescale/imx91.dtsi:7:10: fatal error: imx91-93-common.dtsi: No such file or directory
    7 | #include "imx91-93-common.dtsi"
      |          ^~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.dtbs:141: arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dtb] Error 1
make[2]: *** [scripts/Makefile.build:556: arch/arm64/boot/dts/freescale] Error 2
make[2]: Target 'arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1512: freescale/imx91-tqma9131-mba91xxca.dtb] Error 2
In file included from arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi:12,
                 from arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dts:12:
arch/arm64/boot/dts/freescale/imx91.dtsi:7:10: fatal error: imx91-93-common.dtsi: No such file or directory
    7 | #include "imx91-93-common.dtsi"
      |          ^~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.dtbs:141: arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dtb] Error 1
make[2]: *** [scripts/Makefile.build:556: arch/arm64/boot/dts/freescale] Error 2
make[2]: Target 'arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1512: freescale/imx91-phyboard-segin.dtb] Error 2
In file included from arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts:9:
arch/arm64/boot/dts/freescale/imx91.dtsi:7:10: fatal error: imx91-93-common.dtsi: No such file or directory
    7 | #include "imx91-93-common.dtsi"
      |          ^~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.dtbs:141: arch/arm64/boot/dts/freescale/imx91-11x11-evk.dtb] Error 1
make[2]: *** [scripts/Makefile.build:556: arch/arm64/boot/dts/freescale] Error 2
make[2]: Target 'arch/arm64/boot/dts/freescale/imx91-11x11-evk.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1512: freescale/imx91-11x11-evk.dtb] Error 2
In file included from arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi:8,
                 from arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts:15:
arch/arm64/boot/dts/freescale/imx93.dtsi:6:10: fatal error: imx91-93-common.dtsi: No such file or directory
    6 | #include "imx91-93-common.dtsi"
      |          ^~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.dtbs:141: arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dtb] Error 1
make[2]: *** [scripts/Makefile.build:556: arch/arm64/boot/dts/freescale] Error 2
make[2]: Target 'arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1512: freescale/imx93-tqma9352-mba93xxla.dtb] Error 2
In file included from arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts:9:
arch/arm64/boot/dts/freescale/imx93.dtsi:6:10: fatal error: imx91-93-common.dtsi: No such file or directory
    6 | #include "imx91-93-common.dtsi"
      |          ^~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.dtbs:141: arch/arm64/boot/dts/freescale/imx93-11x11-evk.dtb] Error 1
make[2]: *** [scripts/Makefile.build:556: arch/arm64/boot/dts/freescale] Error 2
make[2]: Target 'arch/arm64/boot/dts/freescale/imx93-11x11-evk.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1512: freescale/imx93-11x11-evk.dtb] Error 2
In file included from arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi:13,
                 from arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts:13:
arch/arm64/boot/dts/freescale/imx93.dtsi:6:10: fatal error: imx91-93-common.dtsi: No such file or directory
    6 | #include "imx91-93-common.dtsi"
      |          ^~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.dtbs:141: arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dtb] Error 1
make[2]: *** [scripts/Makefile.build:556: arch/arm64/boot/dts/freescale] Error 2
make[2]: Target 'arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1512: freescale/imx93-phyboard-nash.dtb] Error 2
In file included from arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi:13,
                 from arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts:13:
arch/arm64/boot/dts/freescale/imx93.dtsi:6:10: fatal error: imx91-93-common.dtsi: No such file or directory
    6 | #include "imx91-93-common.dtsi"
      |          ^~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.dtbs:141: arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dtb] Error 1
make[2]: *** [scripts/Makefile.build:556: arch/arm64/boot/dts/freescale] Error 2
make[2]: Target 'arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1512: freescale/imx93-phyboard-segin.dtb] Error 2
In file included from arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi:7,
                 from arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts:8:
arch/arm64/boot/dts/freescale/imx93.dtsi:6:10: fatal error: imx91-93-common.dtsi: No such file or directory
    6 | #include "imx91-93-common.dtsi"
      |          ^~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.dtbs:141: arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dtb] Error 1
make[2]: *** [scripts/Makefile.build:556: arch/arm64/boot/dts/freescale] Error 2
make[2]: Target 'arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1512: freescale/imx93-kontron-bl-osm-s.dtb] Error 2
make: *** [Makefile:248: __sub-make] Error 2
make: Target 'freescale/imx8dx-colibri-eval-v3.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-var-som-symphony.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-nitrogen-enc-carrier-board.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1046a-qds.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-prt8mm.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1028a-kontron-sl28.dtb' not remade because of errors.
make: Target 'freescale/imx8qxp-tqma8xqp-mba8xx.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-beacon-kit.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-venice-gw73xx-2x.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-var-som-symphony.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-icore-mx8mp-edimm2.2.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-innocomm-wb15-evk.dtb' not remade because of errors.
make: Target 'freescale/imx8qm-apalis-v1.1-eval.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-aristainetos3-proton2s.dtb' not remade because of errors.
make: Target 'freescale/imx8dx-colibri-iris-v2.dtb' not remade because of errors.
make: Target 'freescale/imx8mn-ddr3l-evk.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-icore-mx8mm-edimm2.2.dtb' not remade because of errors.
make: Target 'freescale/imx8mn-evk.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-dhcom-pdk3.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-phyboard-polis-rdk.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-venice-gw72xx-2x.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-venice-gw7901.dtb' not remade because of errors.
make: Target 'freescale/imx8mn-beacon-kit.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1028a-kontron-sl28-var1.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1028a-kontron-sl28-var3.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-debix-som-a-bmb-08.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-verdin-nonwifi-dahlia.dtb' not remade because of errors.
make: Target 'freescale/imx8qxp-ai_ml.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-verdin-wifi-dev.dtb' not remade because of errors.
make: Target 'freescale/s32v234-evb.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-skov-revb-lt6.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-phg.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-nitrogen-smarc-universal-board.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-venice-gw71xx-0x.dtb' not remade because of errors.
make: Target 'freescale/imx8ulp-evk.dtb' not remade because of errors.
make: Target 'freescale/imx8qxp-colibri-iris.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-emtop-baseboard.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-hummingboard-pro.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1028a-kontron-sl28-var4.dtb' not remade because of errors.
make: Target 'freescale/imx8mq-librem5-r4.dtb' not remade because of errors.
make: Target 'freescale/imx8dx-colibri-aster.dtb' not remade because of errors.
make: Target 'freescale/imx8mn-rve-gateway.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-venice-gw71xx-2x.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls2080a-rdb.dtb' not remade because of errors.
make: Target 'freescale/imx8mq-pico-pi.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-verdin-wifi-mallow.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-msc-sm2s-ep1.dtb' not remade because of errors.
make: Target 'freescale/imx8dxl-evk.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1043a-qds.dtb' not remade because of errors.
make: Target 'freescale/s32g399a-rdb3.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-venice-gw72xx-0x.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-verdin-wifi-ivy.dtb' not remade because of errors.
make: Target 'freescale/imx8mn-bsh-smm-s2.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-aristainetos3-adpismarc.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-verdin-nonwifi-mallow.dtb' not remade because of errors.
make: Target 'freescale/imx8qxp-tqma8xqps-mb-smarc-2.dtb' not remade because of errors.
make: Target 'freescale/imx8mn-dimonoff-gateway-evk.dtb' not remade because of errors.
make: Target 'freescale/imx93-tqma9352-mba93xxca.dtb' not remade because of errors.
make: Target 'freescale/imx8mq-tqma8mq-mba8mx.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1012a-oxalis.dtb' not remade because of errors.
make: Target 'freescale/imx93-14x14-evk.dtb' not remade because of errors.
make: Target 'freescale/imx8dx-colibri-iris.dtb' not remade because of errors.
make: Target 'freescale/imx8mn-var-som-symphony.dtb' not remade because of errors.
make: Target 'freescale/imx95-toradex-smarc-dev.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-kontron-smarc-eval-carrier.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls2080a-simu.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1046a-frwy.dtb' not remade because of errors.
make: Target 'freescale/imx93-9x9-qsb.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-verdin-wifi-yavia.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-evk.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-verdin-nonwifi-yavia.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-verdin-wifi-mallow.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-debix-model-a.dtb' not remade because of errors.
make: Target 'freescale/imx8qm-apalis-v1.1-ixora-v1.2.dtb' not remade because of errors.
make: Target 'freescale/imx8mq-evk.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-icore-mx8mm-ctouch2.dtb' not remade because of errors.
make: Target 'freescale/imx8mq-zii-ultra-rmb3.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-phygate-tauri-l.dtb' not remade because of errors.
make: Target 'freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb' not remade because of errors.
make: Target 'freescale/fsl-lx2162a-clearfog.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-data-modul-edm-sbc.dtb' not remade because of errors.
make: Target 'freescale/imx8mq-librem5-devkit.dtb' not remade because of errors.
make: Target 'freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1012a-tqmls1012al-mbls1012al-emmc.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-cubox-m.dtb' not remade because of errors.
make: Target 'freescale/fsl-lx2160a-honeycomb.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-skov-revb-hdmi.dtb' not remade because of errors.
make: Target 'freescale/imx8qm-apalis-eval.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-venice-gw7904.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-navqp.dtb' not remade because of errors.
make: Target 'freescale/fsl-lx2160a-qds.dtb' not remade because of errors.
make: Target 'freescale/fsl-lx2160a-bluebox3.dtb' not remade because of errors.
make: Target 'freescale/imx93-var-som-symphony.dtb' not remade because of errors.
make: Target 'freescale/imx8dxp-tqma8xdps-mb-smarc-2.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-nitrogen-r2.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1046a-rdb.dtb' not remade because of errors.
make: Target 'freescale/imx93-tqma9352-mba91xxca.dtb' not remade because of errors.
make: Target 'freescale/imx95-tqma9596sa-mb-smarc-2.dtb' not remade because of errors.
make: Target 'freescale/imx8mn-ddr4-evk.dtb' not remade because of errors.
make: Target 'freescale/imx8mn-bsh-smm-s2pro.dtb' not remade because of errors.
make: Target 'freescale/imx8mq-phanbell.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-venice-gw7903.dtb' not remade because of errors.
make: Target 'freescale/s32g274a-evb.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-ddr4-evk.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-dhcom-pdk2.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1012a-frdm.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1012a-qds.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1043a-rdb.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-phyboard-pollux-rdk.dtb' not remade because of errors.
make: Target 'freescale/imx8qm-mek.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1088a-qds.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1088a-rdb.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-verdin-wifi-dev.dtb' not remade because of errors.
make: Target 'freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb' not remade because of errors.
make: Target 'freescale/imx91-tqma9131-mba91xxca.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-hummingboard-mate.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-venice-gw75xx-0x.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-venice-gw74xx.dtb' not remade because of errors.
make: Target 'freescale/imx8qm-apalis-ixora-v1.1.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-aristainetos3-helios.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-skov-revc-bd500.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-prt8ml.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-verdin-nonwifi-dahlia.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-iot-gateway.dtb' not remade because of errors.
make: Target 'freescale/imx8mq-librem5-r2.dtb' not remade because of errors.
make: Target 'freescale/imx95-libra-rdk-fpsc.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1088a-ten64.dtb' not remade because of errors.
make: Target 'freescale/imx8ulp-9x9-evk.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1028a-qds.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-verdin-wifi-dahlia.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-beacon-kit.dtb' not remade because of errors.
make: Target 'freescale/imx91-phyboard-segin.dtb' not remade because of errors.
make: Target 'freescale/fsl-lx2162a-qds.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb' not remade because of errors.
make: Target 'freescale/imx91-11x11-evk.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-verdin-wifi-dahlia.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-evkb.dtb' not remade because of errors.
make: Target 'freescale/imx93-tqma9352-mba93xxla.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-emcon-avari.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-edm-g-wb.dtb' not remade because of errors.
make: Target 'freescale/imx93-11x11-evk.dtb' not remade because of errors.
make: Target 'freescale/imx95-19x19-evk.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-hummingboard-ripple.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1012a-tqmls1012al-mbls1012al.dtb' not remade because of errors.
make: Target 'freescale/fsl-lx2160a-clearfog-cx.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-tqma8mqml-mba8mx.dtb' not remade because of errors.
make: Target 'freescale/imx95-19x19-verdin-evk.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-verdin-nonwifi-ivy.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-dhcom-drc02.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-toradex-smarc-dev.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-verdin-wifi-ivy.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-skov-revc-hdmi.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-verdin-nonwifi-yavia.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1012a-rdb.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1012a-frwy.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1028a-kontron-sl28-var2.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-verdin-nonwifi-mallow.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-venice-gw73xx-0x.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-kontron-bl-osm-s.dtb' not remade because of errors.
make: Target 'freescale/fsl-lx2160a-bluebox3-rev-a.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-verdin-wifi-yavia.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-mx8menlo.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls2081a-rdb.dtb' not remade because of errors.
make: Target 'freescale/imx8mq-mnt-reform2.dtb' not remade because of errors.
make: Target 'freescale/imx8qxp-colibri-iris-v2.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls2088a-rdb.dtb' not remade because of errors.
make: Target 'freescale/imx8mq-zii-ultra-zest.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-tqma8mpql-mba8mpxl.dtb' not remade because of errors.
make: Target 'freescale/imx8qm-apalis-eval-v1.2.dtb' not remade because of errors.
make: Target 'freescale/s32g274a-rdb2.dtb' not remade because of errors.
make: Target 'freescale/imx93-phyboard-nash.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-verdin-nonwifi-dev.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-ultra-mach-sbc.dtb' not remade because of errors.
make: Target 'freescale/imx8mn-tqma8mqnl-mba8mx.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-kontron-bl-osm-s.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls2080a-qds.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-verdin-nonwifi-ivy.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-data-modul-edm-sbc.dtb' not remade because of errors.
make: Target 'freescale/imx8mq-librem5-r3.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls2088a-qds.dtb' not remade because of errors.
make: Target 'freescale/imx8mq-kontron-pitx-imx8m.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-venice-gw7902.dtb' not remade because of errors.
make: Target 'freescale/fsl-lx2160a-rdb.dtb' not remade because of errors.
make: Target 'freescale/imx95-19x19-evk-sof.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-venice-gw82xx-2x.dtb' not remade because of errors.
make: Target 'freescale/imx93-phyboard-segin.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-verdin-nonwifi-dev.dtb' not remade because of errors.
make: Target 'freescale/imx8mm-kontron-bl.dtb' not remade because of errors.
make: Target 'freescale/imx8dxp-tqma8xdp-mba8xx.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-hummingboard-pulse.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-libra-rdk-fpsc.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-venice-gw75xx-2x.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-evk.dtb' not remade because of errors.
make: Target 'freescale/imx8qxp-colibri-eval-v3.dtb' not remade because of errors.
make: Target 'freescale/imx943-evk.dtb' not remade because of errors.
make: Target 'freescale/imx8qxp-colibri-aster.dtb' not remade because of errors.
make: Target 'freescale/imx8mq-nitrogen.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-skov-basic.dtb' not remade because of errors.
make: Target 'freescale/imx8mq-thor96.dtb' not remade because of errors.
make: Target 'freescale/fsl-ls1028a-rdb.dtb' not remade because of errors.
make: Target 'freescale/imx8mq-hummingboard-pulse.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-iota2-lumpy.dtb' not remade because of errors.
make: Target 'freescale/imx8mn-venice-gw7902.dtb' not remade because of errors.
make: Target 'freescale/imx8qxp-mek.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-skov-revc-tian-g07017.dtb' not remade because of errors.
make: Target 'freescale/imx93-kontron-bl-osm-s.dtb' not remade because of errors.
make: Target 'freescale/imx95-15x15-evk.dtb' not remade because of errors.
make: Target 'freescale/imx8mp-dhcom-picoitx.dtb' not remade because of errors.






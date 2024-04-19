Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB0812F36C
	for <imx@lists.linux.dev>; Fri, 19 Apr 2024 14:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.156.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713538391; cv=none; b=YL4kFZSz5RCvnRaZMyDcuZSsDAhGlK7b5a1FjVg0OoZwkbdyGRoJafYiZLnWwUGCiXV7yyC/fh0Nq7rlCRE6EH/Lyf5QZeLnOxd5AGsKLtkVHhx8xqpgTEmp84lrNG+kywJy2RF59Rb6mmqCVYL4u93zawpqKAdGluAmIK6oHoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713538391; c=relaxed/simple;
	bh=YL0cVfNueetCwAT7UvDjnlJfn4qwAPNXDHmpE9l31co=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=co2Vnx/378m3z7aQ/1vxOuZ4jOJc4W4OV3t2gnjG1mz7fPmBQAd8tY9wzLiHVlTHCw9pyTd3kljGE+NTSPkNFo3QTH4HWyyS0GI9yXxy93XgIt6S/R8QjCa7wMFjN6EMZ4CZPbfmCCJAc8ehLR6wiVvpek3Bo57e2YVOxY9U94k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engicam.com; spf=pass smtp.mailfrom=engicam.com; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=M6guRH9B; arc=none smtp.client-ip=62.149.156.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engicam.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=engicam.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="M6guRH9B"
Received: from engicam.com ([146.241.23.200])
	by Aruba Outgoing Smtp  with ESMTPSA
	id xpYprTscuBZCLxpYprR4s8; Fri, 19 Apr 2024 16:49:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1713538198; bh=YL0cVfNueetCwAT7UvDjnlJfn4qwAPNXDHmpE9l31co=;
	h=From:To:Subject:Date:MIME-Version;
	b=M6guRH9BNHbelpUdDddvhf4J0lyaN7w28cLvwgYycubGci2pZfJL/A7tmmboV7xe4
	 iyl1w4cSqCjQd91EybhkcpSxnNaaqfsDYSbAD7wHJD9glBMWP+YChfzS8jjlDVdi5a
	 a8/O98UYvL6odiR0qfb7ueSTfoGX1sLi/pmi0qMbXiINCNhJccEiIr9DC+aepdWyNt
	 X6AKupGMRVflrgkOKvIMHgYXQLaM9uXFmRRZWljQhDe5GQGWZkMoLSUhprQ1BjC0/t
	 GrMjItZy23SX6JmRe8eAaA+ioBIhWU0ECkn4FYlBMnUhhl2yo6IT+p2fOyhe3eQeUu
	 zTcQX02YYnKUQ==
From: Fabio Aiuto <fabio.aiuto@engicam.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabio.aiuto@engicam.com>
Subject: [PATCH v3 0/3] arm64: dts: imx93: add i.Core MX93 EDIMM 2.0 board
Date: Fri, 19 Apr 2024 16:49:50 +0200
Message-Id: <20240419144953.8700-1-fabio.aiuto@engicam.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfFo4JUBZwzm009nJ7bZbsQToPtL1WuiHrMH5BlyIi9hFk9/DXdbwK2z7r/FGpI/rRoSTXCINQoxNtXxbK1L8fSaRJZJYcs2yoXfyUsWN9jDHMPbJ5JvW
 bEXA/DmyTJyZvcvn2s34qTP5+6B4YL+ZlyVsTvtk4pE+vbY9QQ8ed0A1EtBfbhh5kFMrGGLcdlb9KyCH2eVkZHPcMcuJ2U8HW8ekjJf1omrq3Q+0ERyks/lV
 D5+4OOvxd9Ch17AhHgvnXpdXXe2zu6SFU/hGGmwPOvZe3vAdS1zDPtzhApW1tRI6EJw9ysNaHYLoYRA/qPV0I8DhVAA/wkl5MGLMQl79zKO9jO27neu1EGc3
 c85+KQXZrz4efyiI1GacOLhfUmlyRY30+jdgUNv/b68R6yJ614qF8u4uUdqjV5d37zskvqZoiHOAn/bJipv45E5im5f7ft8IQAddl1q3KIDxfPgailyinQCS
 Hmc7PCv5LT7FQb/GPG0Co2Oa8niG6saDOOD4wMYx9nKIDJlSmWX9V4/5JeV034MsRildFW72mPz8c4+c

Hello all,

this patchset adds support for i.Core MX93 EDIMM 2.0 Starter Kit,
a SoM + Evaluation Board combination from Engicam.

The number of patch has diminished to 3, for I dropped the
patch introducing a change in nxp,pca9450 binding which has
been already submitted in regulator tree.

(Dropped also regulator tree maintainers as recipients for
they aren't anymore involved in this patchset)

Thanks in advance,

fabio
---
v2 ---> v3:
	- fixed dtschema warnings
	- added Acked/Reviewed-by tags
	- removed regulator-always-on on
	  bt_reg_on
	- fixed clock rate assignment on
	  sgtl5000 node
	- added wdog_b-warm-reset; property in pmic
	- fixed indentation issue

v1 ---> v2:
        - dropped patch updating nxp,pca9450 binding
        - fixed indentation issue
        - fixed missing space issue
        - improved naming of regulator nodes
        - removed unneeded include
        - fixed email recipients

Fabio Aiuto (3):
  dt-bindings: arm: fsl: add Engicam i.Core MX93 EDIMM 2.0 Starter Kit
  arm64: dts: imx93: add Engicam i.Core MX93 SoM
  arm64: dts: imx93: Add Engicam i.Core MX93 EDIMM 2.0 Starter Kit

 .../devicetree/bindings/arm/fsl.yaml          |   7 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx93-icore-mx93-edimm2.dts | 347 ++++++++++++++++++
 .../boot/dts/freescale/imx93-icore-mx93.dtsi  | 271 ++++++++++++++
 4 files changed, 626 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-icore-mx93-edimm2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-icore-mx93.dtsi

-- 
2.34.1


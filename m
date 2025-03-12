Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 092901F4E57
	for <imx@lists.linux.dev>; Wed, 12 Mar 2025 07:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741765261; cv=none; b=ofYrKYTGm66tW6ptr2b5cBuRQuqGVl3FmDUCai8aV0yripkFs6J6jMU54esdgjXbKvGDuUcM4eWYa4FDXnU8/5vIDOHPY0wGDngmLWEkFLqSnwANIbC3SIUvS/z+ogYHJgj/ESlhppHT7PdUXuRz/qiivbm0QS2vpob9ogo2Ofg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741765261; c=relaxed/simple;
	bh=DEBfzBJ+3aotatap99JXA4AAYCmok3ICrUfF5HVCsDE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EvLL1FcR+xPhtNAVAs7ZSHNmcJwe6aHogduun8+oRy88oCh7BmkLbr+DGqD3WkxJIqL8vGwtCro1NOqQKyf31aDlXq4JlMoFBCV36xrzFeLbs5ueO6JV81tiZu2az2kZcENdG+uFUcatN7w9p4jooOrEX8kKXPcAuppIrGyiR0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Vco/OHRK; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Vco/OHRK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=fHft6
	4F3TLs6vn9uOrrKaF+BvY2zu4crhf+LJniOPRM=; b=Vco/OHRK4F0SUaFxW9hVm
	L+qHjuOrDoHUClKhNdIHZvmh+gzffM3DmcqOR2nySTlZmHK1Ueamg/RygfgXGVjx
	+K7oSqt65DsUs21dFZhcxOEweOBJ4szsVLcqAMWegLEf0/tvsXCinho29dX6hyQU
	Pte3ijui+erR6s1d589s4I=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAnwdRtOtFnQ6_FAA--.2767S4;
	Wed, 12 Mar 2025 15:40:31 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/5] i.MX dt-bindings changes for 6.15
Date: Wed, 12 Mar 2025 15:40:03 +0800
Message-Id: <20250312074005.663165-3-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312074005.663165-1-shawnguo2@yeah.net>
References: <20250312074005.663165-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Ms8vCgAnwdRtOtFnQ6_FAA--.2767S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7ArW7WrW5ur45ZFy5uw17Jrb_yoW8GF1rpF
	nxCFnrGr1kJF1UJrnxtw1DAw18Xr17Aa17JF17Jw18Aas0yF1UXr1rtw1rury3JryxXF1S
	yF17Cr1DKw1UX37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jhpnPUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxcOZWfRB3jvOgAAsr

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-6.15

for you to fetch changes up to 401735c5f28f41561f60dc11b67520479694f422:

  dt-bindings: arm: fsl: Add VAR-SOM-MX6UL SoM and Concerto board (2025-03-11 11:35:54 +0800)

----------------------------------------------------------------
i.MX dt-bindings changes for 6.15:

- Add compatibles for Skov i.MX8MP variants, VAR-SOM-MX6UL SoM and
  Concerto, i.MX95 15x15 EVK, btt3 i.MX28
- Drop Toradex SOMs compatibles

----------------------------------------------------------------
Ahmad Fatoum (1):
      dt-bindings: arm: fsl: add more compatibles for Skov i.MX8MP variants

Antonin Godard (1):
      dt-bindings: arm: fsl: Add VAR-SOM-MX6UL SoM and Concerto board

Francesco Dolcini (1):
      dt-bindings: arm: fsl: drop usage of Toradex SOMs compatible alone

Frank Li (1):
      dt-bindings: arm: fsl: add i.MX95 15x15 EVK board

Lukasz Majewski (1):
      dt-bindings: arm: Document the btt3 i.MX28 based board

 Documentation/devicetree/bindings/arm/fsl.yaml | 27 +++++++++++---------------
 1 file changed, 11 insertions(+), 16 deletions(-)


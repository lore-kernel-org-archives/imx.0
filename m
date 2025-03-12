Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4429C20B208
	for <imx@lists.linux.dev>; Wed, 12 Mar 2025 07:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741765264; cv=none; b=gj0eCnDuqL7RiA61WW6JJXlERJdg3/HEWsIF2hUuL2+kO909gkvo2lTmDAXA6lNqGjEe7LcNjHeJDD6c1ezw3AChGwfGDHcrLhO6r74PI8Z9mCpld7Ofe7MkrkY4bLrorW3tc9o2Cqa/QYRk5luNMdrPplPD1Vh0abQTf21sy3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741765264; c=relaxed/simple;
	bh=Ll0u4SL2ekYYJZhxDteT/U6jFtv7SYneFXCAknm1IR0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bMjQekb1U25WYSzMZByAlDaldBELaQCaMBXIBQYQd4zNnpR4bmyE8s7Ldb1phPdOfPqIFMATD9ut+LsUe+KPg3wHhdUuDr70Pz1S+8WCJtiTI5+Jb7oHXWLzcic5ibTxD1xneS97Gz6hS51W4D65dkx1e51Usi/CUInDVVF9lIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=njprxXF8; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="njprxXF8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=hDg8L
	yTwf6Z5RZfJ2WcwAVMbQDI394/OUmNQpCPItl0=; b=njprxXF8Bppm24AkPfqjN
	7EbCLpa0AuOG4Tt3D0lIHuDbeLNw+8LwzM79+7v1ZO8IoTrBIsxF1gmmuulOYCLP
	PVjXPZdTED09GZ73BsP6G8IxFARi9vzPCf77mOeDq+hIhFShhO2fwqXPy1nNzkIm
	8SD78swPiSAUFtVl1pm5d0=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAnwdRtOtFnQ6_FAA--.2767S3;
	Wed, 12 Mar 2025 15:40:31 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/5] i.MX SoC changes for 6.15
Date: Wed, 12 Mar 2025 15:40:02 +0800
Message-Id: <20250312074005.663165-2-shawnguo2@yeah.net>
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
X-CM-TRANSID:Ms8vCgAnwdRtOtFnQ6_FAA--.2767S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryrAF1DCrW5uFW5ur45KFg_yoWfGFX_GF
	9rJF4xJr1UJr13Aw15Gr10qr1UJw1kGFyUur18tr4Utr1Iq3W5Jwnrtr48Xr1DXF18GrWU
	Gr1UWw1kJw1IkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8xgA7UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhEOZWfRL8cyTQAAsJ

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-soc-6.15

for you to fetch changes up to 4f8ec94af325d501904d7e86363bd162004161bd:

  ARM: imx: mark imx53_suspend_sz as unused (2025-03-11 10:57:51 +0800)

----------------------------------------------------------------
i.MX SoC changes for 6.15:

- Mark imx53_suspend_sz as __maybe_unused to fix a possible build warning

----------------------------------------------------------------
Arnd Bergmann (1):
      ARM: imx: mark imx53_suspend_sz as unused

 arch/arm/mach-imx/common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


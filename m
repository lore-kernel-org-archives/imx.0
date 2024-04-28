Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A221F69D3C
	for <imx@lists.linux.dev>; Sun, 28 Apr 2024 12:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714306400; cv=none; b=E675nSvx4NUn6GBSqAPN8WDJO4KmX42tk96BAA6fpDcjy19ZTa3PusnNQEGjZpfcwIwjZY1+SEx9sLLM4DH1piagF5gAx8pfNYC+t0aZAa19ARb+C12lArOs5WWQrIcYM3u4tOj6xbs7Uyj2wLP9Xs2KI4x9BVFzbWX7yE0Ro/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714306400; c=relaxed/simple;
	bh=UdbZyInltYfUCBYOkkFerJFqGiGNC0XMov9VR0hqz6c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H1+uxQEXfCDy5UBhiaaTtkmnTUj/bLcgjRHYZDAI5lbB1emdtVpqvLVQSmnB4wP9DoSKcDdgo3vysyv8t8J7/zhzCMHC4msBZuBht3aWWjIeXxcPmjOzVfQB546lCFNj9CvmcckKZpg8kGL1WITqOKANU0E7ZeIT3IfYJwVRT8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=QD+oScgo; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="QD+oScgo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=f9J+2
	xd2MjCae/FtXnzZ2t/+65jAWil7L/FZxif8cXo=; b=QD+oScgopsiK6GdNieqmR
	mYpXk76ONOtbI4Knip21OzpVEPwfdjDa8aN6oK2Rnr1C3X/UD6AZh3e94iG4R8f/
	87PBwPtcjZm21J7elwTZt953Zp2mRnUqAOa5bvSkwTn1/tckw+x4kNhACjLP/16J
	JYU24s5NmOSoUhUJ/VPLec=
Received: from localhost.localdomain (unknown [114.216.210.46])
	by smtp1 (Coremail) with SMTP id ClUQrAD3v19HPS5mcJTNAw--.22534S3;
	Sun, 28 Apr 2024 20:12:57 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/5] i.MX DT bindings for 6.10
Date: Sun, 28 Apr 2024 20:12:44 +0800
Message-Id: <20240428121247.10370-2-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240428121247.10370-1-shawnguo2@yeah.net>
References: <20240428121247.10370-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:ClUQrAD3v19HPS5mcJTNAw--.22534S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFWxXryrCr4rGr1fKr43trb_yoW8Ar1fpF
	sxCF9xGr10yF17Jrsxt3WkAF4UXr1kAF13JFsxWF1xJ3W5Aw1jqr95tw1rZr9rAFyxWFW3
	AF18Cr1FgryUAw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jntxhUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiDQnOZVszXcuKCgAAsR

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-6.10

for you to fetch changes up to 6687155ffc6671514f2ef874ac8be41d9d131918:

  dt-bindings: usb: usbmisc-imx: add fsl,imx8ulp-usbmisc compatible (2024-04-22 11:47:55 +0800)

----------------------------------------------------------------
i.MX DT bindings for 6.10:

- Add vendor prefix for Emcraft Systems
- Add compatible for new boards: Emcraft Systems i.MX8M Plus NavQ+ Kit,
  Colibri iMX8DX, Seeed studio NPi base board, NXP S32G3 board
- Drop reduntant toradex,colibri-imx8x from fsl.yaml
- Add usbmisc compatible for i.MX8ULP

----------------------------------------------------------------
Gilles Talis (2):
      dt-bindings: vendor-prefixes: Add Emcraft Systems
      dt-bindings: arm: Add Emcraft Systems i.MX8M Plus NavQ+ Kit

Hiago De Franco (2):
      dt-bindings: arm: fsl: remove reduntant toradex,colibri-imx8x
      dt-bindings: arm: fsl: Add Colibri iMX8DX

Parthiban Nallathambi (1):
      dt-bindings: arm: fsl: Add Seeed studio NPi based boards

Wadim Mueller (1):
      dt-bindings: arm: fsl: add NXP S32G3 board

Xu Yang (1):
      dt-bindings: usb: usbmisc-imx: add fsl,imx8ulp-usbmisc compatible

 Documentation/devicetree/bindings/arm/fsl.yaml     | 22 +++++++++++++++++++---
 .../devicetree/bindings/usb/fsl,usbmisc.yaml       |  1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |  2 ++
 3 files changed, 22 insertions(+), 3 deletions(-)


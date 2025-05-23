Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F411E288C1B
	for <imx@lists.linux.dev>; Fri, 23 May 2025 08:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747988984; cv=none; b=CiLZQirPjeo5+ZJI2lIRE9xI1TyFQQi5K77KAJtpK/LovIFaIHJQeADLCyjKJuWdmqV8OTPp6EB69Erm/YHW5tIXi63s6xj4em1Upt2gB3Euh8GnqOMTY/GVqn/lf63no9UyCLVcwHA0vMa1oWxaiaLa2pDvZ77VEQonqqc1BRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747988984; c=relaxed/simple;
	bh=qUlUIZYdAX+W/1PkkjNty+aRerMPzcFJcmu8UhVVGO4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EGSAZQ987XEMdRB74b+Wf5VfhMNcWOdiAkiOwCQfPlYBl4Ersk7PoXnqvI9AnK6JMVGKHOoTlnwnMfJUPbfzmgHI2dUnCKfJ6NXcnIC0m8uZvVPBabKFzXGhkTTtAQ17Bc6xqD+KvNtQ1DqyBhH8vCh6ROOXt2fY9J2NhMnrvYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=FqEv8FK1; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="FqEv8FK1"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id CCC981F997;
	Fri, 23 May 2025 10:29:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1747988979;
	bh=kxQtaXcsjM2ovX5/37rHFvmUdzjRjLApt0L/oLOpB2U=; h=From:To:Subject;
	b=FqEv8FK1TSN1d00jlAH6vrEHuFlvuJxvd1CbULeF+5cxvuSV1U3gYwYIO77wQLxzJ
	 JTySDQll53QlEazU+gxs54PnFAMcC7gwzSUrOiUUBy0ekthUp8uMP7ELHgru+vEFyp
	 TTSGRtZYmO4z8LoTEG+8OLqxSXMxHYtaQc+ZSgEu0qC+C8xie4p8YaPUdhNqZldPnS
	 eK+gqKKxmeH4zw/JJ50QN0BnkjPQaa1fqrvp9XG4dM4VY8Z4TBy9qO4Kkw5cBgOZ0D
	 Q/bY+tyuFHvQckfOMq0Lbva0UPykA5Xch57hITbnIVDn48ianX2O6qW5je2TZXPHl0
	 5+2v0ZizUU05Q==
From: Francesco Dolcini <francesco@dolcini.it>
To: Dong Aisheng <aisheng.dong@nxp.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] i2c: lpi2c: implement master_xfer_atomic callback
Date: Fri, 23 May 2025 10:29:29 +0200
Message-Id: <20250523082931.23170-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

This series adds atomic operations support to the imx-lpi2c driver and split
the previous v3 patch into two separate patches.

The first patch replaces the open-coded polling loops with readl_poll_timeout.
This improves readability and consistency, and prepares the code for
integration of the second patch, while maintaining the same functionality.

The second patch implements the .master_xfer_atomic() callback, enabling
support for atomic I2C transfers.

Emanuele Ghidoli (2):
  i2c: lpi2c: use readl_poll_timeout() for register polling
  i2c: lpi2c: implement master_xfer_atomic callback

 drivers/i2c/busses/i2c-imx-lpi2c.c | 262 +++++++++++++++++++----------
 1 file changed, 176 insertions(+), 86 deletions(-)

-- 
2.39.5


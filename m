Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A0A51D014A
	for <imx@lists.linux.dev>; Wed,  4 Sep 2024 14:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725460566; cv=none; b=S8Jp11fASMYOTc5SSpa3Ueib0VtJMi/jJSuq+e3vhqHqm5sTTjoX8xWoE87iOBUat/ks4+146Qx+TaOWLlDkeAhngvlvZOqw3lJy3rGxypWZc3RVGa/hqW6FXvttWalBR6UMx5VRJDgnHoAwKF9CHmeTgI4VoEk5A3b8T/eXtNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725460566; c=relaxed/simple;
	bh=QubftTb2FJIn6cpIGkdU6nZBW8TFaS1bX9IfCRK9Evo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Thhb7WfRU4wNg6w5wRUmi63TVrZv/1Pyx6ltVVOCkChWKjY5LU49WvACfrBHbUx2WSOE0Z5uZ1tFDO/Kbh31iQYdD+y0A1oqgn7EHPUJmK/+aMH+f5+OquUHP/WBcq31stdvKrFGAvoQa3c8uF9FLIKthy/ERbK1wb36kZep7PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=GjKi2/Ky; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="GjKi2/Ky"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=4bEuN
	S8X3brko8E5DQEV29rm5qF2XnQcrm45sbKPKRA=; b=GjKi2/KycJ29hXXDM0cH4
	ehDEIvbTBEgEXtHjb2eW7I3f50RPy7iXAJb8tADoZ0zB7coss5P4xY0anNAt0Ta4
	gsrwoouGF8/vP9oS0Jt7V7sh6pIEelQqojrQJwtyfBQokY+ef2ZAdeHvxLfs4SR/
	wtNsmKYIdV8pMDpxDxXENU=
Received: from localhost.localdomain (unknown [114.216.210.89])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCHd9UEcNhmUkhrAA--.17423S7;
	Wed, 04 Sep 2024 22:34:48 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/6] i.MX defconfig changes for 6.12
Date: Wed,  4 Sep 2024 22:34:39 +0800
Message-Id: <20240904143439.211552-6-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904143439.211552-1-shawnguo2@yeah.net>
References: <20240904143439.211552-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgCHd9UEcNhmUkhrAA--.17423S7
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryxJF1xCrWrCrW5Zr1UWrg_yoWfCFg_GF
	y8J3WxJr4UJr1xG3W5Xw1xArWUK3WUGa4UXry8tF47uF13tr13tw1UXr45Wr18X3WUCr4q
	yr4UAw1kJr1UJjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8SJPtUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiERlQZWbYQmJzlQAAsF

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-6.12

for you to fetch changes up to 7f66e5271706484b0ef127f070af737b0ce67585:

  arm64: defconfig: Enable ADP5585 GPIO and PWM drivers (2024-09-01 17:11:11 +0800)

----------------------------------------------------------------
i.MX defconfig changes for 6.12:

- Enable ADP5585 GPIO and PWM drivers in arm64 defconfig, which are
  needed by i.MX93 11x11 EVK board.

----------------------------------------------------------------
Liu Ying (1):
      arm64: defconfig: Enable ADP5585 GPIO and PWM drivers

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)


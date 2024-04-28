Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A7956A33F
	for <imx@lists.linux.dev>; Sun, 28 Apr 2024 12:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714306400; cv=none; b=BmV6Q4Ougs1GFhdB5HElmdY9NRT/Vi8ZjHrUeNqXMhYQKHKY87jTnKzuVyKUlNLy9kTdrg23eZXdxVk1S0eXyVMMQzrx1gM880pLWPS83maAzQn8gx0A9tt5ppAM/RVCoXTB+msTyMgz1QnasEdo+mEA+MrVojcZPLfAWnPC+6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714306400; c=relaxed/simple;
	bh=FIMcVy41s4s78EKkt0No7aJ2EjMr6jQgjLXOdqbJUaM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BBS6iGbGIQoQhaCZw6+ZJxXzZryeUao3UbILGpvfQb19LnFyzdlDsojJjZxYW/7b8t2031nxIyPioqFkOtoj43nlieyjNSun2L78GrgvjeZMe1r6nxc3pxlaBBPg5GyonmToLZHYx0jzJO11U9DhG4iTq8N0xczkKM9Q3CUX1Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=OCDuPYCY; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="OCDuPYCY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=V6AkH
	7us/FhA2MMRr/RWOpT53Cn6H0lXgXiYvuGskRc=; b=OCDuPYCYSRgEVsgHmQaIa
	QFL1V/LNywlnjPebvgEPdUuucPUwOzE6Oq6qsOcUg5HX2ZnMbgBlv0KIQIUYAScO
	4gP2P36QjwgswoG+kivn68Lwojw8K3CK75kxy9MN5IBTA/2dVKThwJu/5A7zmf6p
	bSRnXsGoYF2FIQM9NKDq2Q=
Received: from localhost.localdomain (unknown [114.216.210.46])
	by smtp1 (Coremail) with SMTP id ClUQrAD3v19HPS5mcJTNAw--.22534S2;
	Sun, 28 Apr 2024 20:12:56 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/5] i.MX SoC changes for 6.10
Date: Sun, 28 Apr 2024 20:12:43 +0800
Message-Id: <20240428121247.10370-1-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:ClUQrAD3v19HPS5mcJTNAw--.22534S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryrKr47KrW3ZrW8GF45ZFb_yoWfZwc_Ja
	47Ja4UJrW8Jr1rAw1Utw1xCr4ktr47Ja4UGrn8Jr4UJw1xJry8Awn7Xr40qr1jqF4UAr9r
	Gr1UJw1vyr1UCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8Ta0PUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiFQnOZV6NnGd0owAAsI

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-soc-6.10

for you to fetch changes up to 6eaa8431b340577ddfba86cf92f4b52e52370db4:

  ARM: imx: Assign parents for mmdc event_source devices (2024-04-22 13:41:58 +0800)

----------------------------------------------------------------
i.MX SoC changes for 6.10:

- Assign the pmu->dev parent to be the platform device for MMDC driver,
  so that it doesn't appear directly under /sys/devices/.

----------------------------------------------------------------
Jonathan Cameron (1):
      ARM: imx: Assign parents for mmdc event_source devices

 arch/arm/mach-imx/mmdc.c | 1 +
 1 file changed, 1 insertion(+)


Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DAC01F4E59
	for <imx@lists.linux.dev>; Wed, 12 Mar 2025 07:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741765262; cv=none; b=H4x5nIfbyHKwGVJniWn5Zsqc4Q+72ztEnl6SC2NQwM7MFdt7WoAc/woH6vurkDBLCmU/JQkBk48shaJ8QSpf+0rc0YK9pKX7oSwKgoMPXnDKc+2MBPKJG468unEVEA2OydqtBlnDBGOPLTFGHH9YzB9zu0Y8qtSJugZCZbrfg9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741765262; c=relaxed/simple;
	bh=tCdEES9u11zm/T58N0NHIUNEUu9NFiviNIgMZ0lT/Vs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oWGcyFkd2j8PGzO/HbXwz7NPxOhgskHt0mmkNZqPaAgtmfHR/g9v095egi4m9jjxBuHLv7uWEE5VKprJMzRCf8RJkovbv04AX/f6vjN+mvpAJAaH+eGyvl370SicmN+A9Qwh/ua6uqUDVviH3fdX4D21vdukPt5vLiIrdylqwMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=jmY8XlpZ; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="jmY8XlpZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=d6Jsu
	TDCsoktk2NTBO8xvdh4+TgE9AiIWgOBIevFlQI=; b=jmY8XlpZ2m5IH20gSI2Od
	qTmN4Fcu6KnthEylmHcYfJ1Tf97hlm6PloC1vMGd2htYndIXMxyG6l+WqO0jNDDL
	+kKOb0qo60vxbS5YpYr5PuhLCFxtNgsk9AWdcWhBslhP9P83Au2sX9GvK7JlrQDm
	3ljmsgt4BPHqJUIqe2yK3w=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAnwdRtOtFnQ6_FAA--.2767S2;
	Wed, 12 Mar 2025 15:40:30 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/5] i.MX drivers changes for 6.15
Date: Wed, 12 Mar 2025 15:40:01 +0800
Message-Id: <20250312074005.663165-1-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Ms8vCgAnwdRtOtFnQ6_FAA--.2767S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryrAF1DCrW5uFWrJr4xJFb_yoWfGFX_CF
	WxJa18Xr4UJr1UJw48Wr12vr47Jr1xJFyUJF1DtrW7Xw13AF15tF1DXrZFgw1UXr1rGF4q
	yr1UJr1kAr13ZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUb8sqtUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwgOZWfRB3jvNQAAs7

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-6.15

for you to fetch changes up to d3ad803a97c7f53d872eb3e9782c2286cae6954b:

  MAINTAINERS: match mxc in file names by IMX / MXC entry (2025-02-19 17:45:43 +0800)

----------------------------------------------------------------
i.MX drivers changes for 6.15:

- A MAINTAINERS update from Ahmad Fatoum to get mxc drivers matched by
  i.MX entry

----------------------------------------------------------------
Ahmad Fatoum (1):
      MAINTAINERS: match mxc in file names by IMX / MXC entry

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)


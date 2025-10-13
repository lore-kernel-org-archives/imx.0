Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8022C28642A
	for <imx@lists.linux.dev>; Mon, 13 Oct 2025 12:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760358970; cv=none; b=SzGKUL1eEG/rGOcNglFvlJEvnXeYMPvXgY8/5xWGJrdnLpLLwBbijgneB+cwbEO/1/2+yaSdZWybrtw34f8EaHO+Wm8gpqloaLDZ7T4xsDUPBv0WHWcV/W5ZNeOHolgkpezfhSEYgBVu6JvRUcs+ViGpitEQJdF8AOwpi+pXxuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760358970; c=relaxed/simple;
	bh=JN2nrz1jM5oOA3YioyA2ynVFlmP+iurajezl38qJx4o=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=nNPkF+hOKRwLwrel315r131AHch2f4cM/e35N39elL08zet2AqhsiZonlg6YL5wRNM4RU4XS3FDOgau743AW4fY+zOrO8DfFyFpHUGEh67Mze1rAJ+5YpFKnJPdEji4DaLDX8Evs1p+6SP0uyvgf8se2wXVHWwuEH18IWf/NlMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=21iEEdtV; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="21iEEdtV"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1v8HUa-00000000ekf-4APY;
	Mon, 13 Oct 2025 14:17:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=From:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=Du1q0d8iaqBmjtERDybGAzIfy4R227O66LOdBibIRSM=; b=21iEEdtVLyqas0aNnOcZjTKntt
	ZNA7ATosy4Fr6Ptu7q5SB4+t+eicCNXHJtqyfeYwxRoU5FnflligZ51sejMPaKdzk7NVPwkhIxwxA
	vdrXQY5vAyFZ9aPw7t3pFxRVFynn9TRaYZoQNcFN1dmejBRSw1Q3h6nEGVXT3Z0TNHcpujngvKX+8
	CcmbN5LB4WKGPNrbopZ82KmBlp8t1OSJT9ElcwYu4b/s25OK0HbUxi1oY+HkK3Yx8Uqka8AAj3wGa
	efh3upEJn4JIyBOPIFoG7PWpNN60yLLCMi2rFh3cr8+V7yVLMFI3g0ilK3aBO4oVMTdKZyjzAEUeK
	jNnkhKxg==;
From: Andreas Kemnade <andreas@kemnade.info>
To: linux@armlinux.org.uk,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	ebiggers@google.com,
	ardb@kernel.org,
	dario.binacchi@amarulasolutions.com,
	martin.petersen@oracle.com,
	andreas@kemnade.info,
	alexander.stein@ew.tq-group.com,
	stefan.eichenberger@toradex.com,
	lukas.bulwahn@redhat.com,
	tytso@mit.edu,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm: imx_v6_v7_defconfig: enable ext4 directly
Date: Mon, 13 Oct 2025 14:17:09 +0200
Message-ID: <20251013121709.104546-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In former times, ext4 was enabled implicitely by enabling ext3 but with
the ext3 fs gone, it does not get enabled, which lets devices fail to
mount root on non-initrd based boots with an ext4 root.

Fixes: d6ace46c82fd ("ext4: remove obsolete EXT3 config options")
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/configs/imx_v6_v7_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 9a57763a8d38a..0d55056c6f821 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -436,9 +436,9 @@ CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS_XATTR=y
 CONFIG_EXT2_FS_POSIX_ACL=y
 CONFIG_EXT2_FS_SECURITY=y
-CONFIG_EXT3_FS=y
-CONFIG_EXT3_FS_POSIX_ACL=y
-CONFIG_EXT3_FS_SECURITY=y
+CONFIG_EXT4_FS=y
+CONFIG_EXT4_FS_POSIX_ACL=y
+CONFIG_EXT4_FS_SECURITY=y
 CONFIG_QUOTA=y
 CONFIG_QUOTA_NETLINK_INTERFACE=y
 CONFIG_AUTOFS_FS=y
-- 
2.47.3


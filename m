Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711274;
	b=vqRVd0sWenEQLhjRwYjx7VSxuFr0ZsWUe7Pf3PDo1zq3IyYrA1wfZ76F2sw6x/aeNJDL
	 cDrJLF9MUIwpBc1LOsTHzhq+1AF2KqqTFnBqomUTZSbUU7gViUF4XszA+lCQ8Vlt39hvv
	 M1e7Qr79s3kbvMd338M9jY0RfZdFE5OhLq8qr4dPlPlyL9bASSu78ug8LuBSvtVLkgLZC
	 CLMye6gdEIroqfHrAjnlN5x0IVXr8hhqq8JfkZ7ndi0A8Yw4WpDeWz8M2x/u5K+b+o+87
	 /jXCqdlE2VQ+2Ayo70GtDjbSgJMwIcup61nuyW/r92dBQSUsH0ojEWsT5qiBR1953EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9ic7GIeBAEK//ldCqzOdV9U0524b8pdj40NAXKTVFaA=;
	b=vKCEZM6wqGzm3tlMGBPjGHWW+PCCqD5XVBXqanHtypQZ/yOOus2T1X8At4CXv6fuGgW0
	 LZDjZtJ9O+M130YzHK+TO52bgB3JZF35shuBCZyAA0CWHsxdiogWnr+NyQQgET7KkBVWD
	 th/FnRYRt5yn78nDCRCbLFBvsIcK/ZV6j889u7uIYX0FoO8rjaaH57njf2P9PZSvkTR+Y
	 ldM/K3eOW4/g4GoFaR9Tz7QU1wGOtJnsg5BNPHXSRMvsGtbKgSlsuEOui6yKBJOtbbAcz
	 hjSK8aTvecqkFMyhP9WuL25EW8AXJOQ0YRMOcB7XYd3kRUFieXWAXNhm5MZudMEv+Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ct3zO+im;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE4A606A321
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 16:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BE4A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ct3zO+im
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e09aa5264so4225068f8f.2
        for <imx@lists.linux.dev>; Thu, 26 Nov 2026 08:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795711272; x=1796316072; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ic7GIeBAEK//ldCqzOdV9U0524b8pdj40NAXKTVFaA=;
        b=Ct3zO+im41DD+n0QrvvKtkLtwUtifH3zjiT31SvfsF0cBNR1apDiLjW55EC0rx9Zez
         aVfunYfs2H2LPGv246DkAvw5wtkNaGNuUnG+RZhTxFz0xguFIefWXO1vbiG4BP5+9ZUg
         h9IN0Vhy4j1ygaEnr5Xz6klNwaoJLdLkLzbl7lzt8VbEDxIFtc2ngnw3EiTYAV5c4NFr
         WW8gLDVz1DnbQpGT2fcyZ4X4T2lhHPMMhhRBxvnOfW/079P6ze6/FHvDPysOdOOWS2WC
         u238M1DicH0nes4dAtz4qeUuhIRmqYfIJ1JkgOLTwgLXpApNz87ClxM38zkC7g++Tv1K
         tOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711272; x=1796316072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ic7GIeBAEK//ldCqzOdV9U0524b8pdj40NAXKTVFaA=;
        b=v2qZ6xFJZ7/NFliKO5rvdAk1CIz0R55i1lynEIDU6ZEfHi9swpvIrpNba2or7DhZnK
         lwaTCEhK8IjzMLG1ntro99/d1gtGwCJ1m5EMSz5/k/8J4R+KWpHap3Ysn+nFG4HsCDCD
         NqzKE6+bgw1NC+vvwHJFWLEMRcemLvHpifMJZuwqQrXhn6278EzY2Do2K94wFtuzdC62
         C3ELHqH8DOxkuu8Iknv/z4xjjDGVLnXw7etk+meIEl1rJW7I4Ciu3s+Pz/cDA4UJ8C0X
         dFsDayhxlf328QjaPOfRjN6XZ5HDz2QCxKke3BCJxStDJz9uG5kz5HhUO/vii0mGch1Q
         3AYw==
X-Forwarded-Encrypted: i=1; AL+hErFG6n52mqstBiLANrtrLBHBGaFT9igercpRQ8o/pYe6/UnrjsryjqQC242+PkE9dXvX+JY=@lists.linux.dev
X-Gm-Message-State: APuU4Z+Wx+jsKUhxznl9WAnFIobeEdLpgK8YRBSqaSx/2J/OXe3vOKYL
	LEXiS4EStO+CHI5xVAIMOJZfsifewBBegifzELa1hWq/r6oCsT5u2EdU
X-Gm-Gg: AZFdTZeUS9+h/9qQTMwfRtw8L5+R6eTut4PEQHK9DLIRk56l+WwmkzeaE/MNbRsvT4H
	hwEi4q6u9IQ6emQL/QOLeMiUX1vKQnC6J2vsIfg/Dx282WqVpSg35UnH7NUqNrZzOqgkY7i4WmC
	LEmqH2yllLyhp4WWHXR7biekjMNb5Q5kG3dgD/PoxPqzwfEMXphdfKzI8wwIZFN2eFAs8MLyusK
	pieaEv1XAfeyEh9MP7gmWq7/1dou/HVjXnt2F6cOUSUCU6kKo7dvMSiQuvmH23WA7rmEvcE491A
	xZiTOUw3hqpJTm+EHV+nsLy5MS+9pkAPH/jGlGJrJJclo0etl3/5saysgQ4NEb82Ka0oLuPkt2F
	qWBRAtjhOH/pSmO8s5jHltNqg4h5k1gUpFY4kJ8nG2x2CxaMvWqzHVXsQS+YOFvnRB9RCHcxIJ2
	qIjgBtsZHeh6opW67gmIltZ7WJya3IlXKWeNd0X2nXpDUFuPjGQpSU5hm+5E4lTBFX0I3syYDH1
	/zAWJlct1HUv7TSwsd2i3A19QosUIjnPk0EIxaK6Gczh0P48zOGq/rIVY1+iQb1k0wbWMI56gsC
	8JEsTC0okoXViVAjLHSfH+p7E7hROBRna+c9KxQ64zoXbcvrjCS97WY=
X-Received: by 2002:a05:6000:40e0:b0:4b8:5ccc:eed7 with SMTP id ffacd0b85a97d-4b85cccefccmr15497144f8f.51.1795711271385;
        Thu, 26 Nov 2026 08:41:11 -0800 (PST)
Received: from vitor-21h1cto1ww ([2001:8a0:c4c6:f00:6ce3:c28c:2097:7d09])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm39333942f8f.34.2026.11.26.08.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:41:10 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lucas Stach <l.stach@pengutronix.de>,
	Advait Dhamorikar <advaitd@mechasystems.com>,
	Marek Vasut <marex@nabladev.com>,
	Peng Fan <peng.fan@nxp.com>,
	Adam Ford <aford173@gmail.com>
Subject: [PATCH v2 0/2] pmdomain: imx: fix suspend/resume order of the blk-ctrl virtual devices
Date: Thu, 26 Nov 2026 16:40:57 +0000
Message-ID: <20261126164058.2373605-4-ivitro@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

The i.MX8M blk-ctrl drivers drive the GPC domains through the virtual
devices from dev_pm_domain_attach_by_name(). These devices have no
parent and no device link, so their position in dpm_list relative to the
blk-ctrl consumers depends on probe order. When a consumer ends up
before them, the system hangs in the noirq phase.

Patch 1 fixes imx8m-blk-ctrl. It is v1 [2], now also linking the bus
domain virtual device:

- i.MX8MM, VPU: the codecs resume before the virtual devices and the CPU
  hangs in genpd_resume_noirq() of 38310000.video-codec. On Verdin
  iMX8MM this happens on the first suspend to mem.

- i.MX8MP, media: reported by Advait [1], the CPU hangs in
  genpd_resume_noirq() of 32e40000.csi. His debug prints in
  imx8m_blk_ctrl_power_on() show the stall at the first BLK_SFT_RSTN
  read, after pm_runtime_get_sync() on the bus device returned 1.

- i.MX8MP, VPU: a normal boot works only because the Hantro codecs defer
  their probe until the blk-ctrl is bound (the blk-ctrl waits for the
  imx8mp interconnect module), and the deferred retry moves them to the
  end of dpm_list. Loading hantro-vpu after the blk-ctrl has probed
  reproduces the hang on resume.

Patch 2 does the same for imx8mp-blk-ctrl (HSIO and HDMI) and is new in
v2:

- i.MX8MP, HSIO: loading phy-fsl-imx8m-pcie after the blk-ctrl has
  probed puts the PCIe PHY before the virtual devices. On suspend the
  HSIO bus domain is powered off first, and genpd_suspend_noirq() of
  32f00000.pcie-phy never returns. With the module loaded at boot, the
  PHY defers, ends up after the virtual devices, and suspend works.

On Ulf's question in v1 [3]: the GPC domains cannot be genpd parents of
the blk-ctrl domains, because their power-up is interleaved with the
blk-ctrl reset and clocks (see 25e252bcf159), so the blk-ctrl drives
them with runtime PM on the virtual devices. The consumer drivers only
see the blk-ctrl domains. Runtime PM is disabled in the noirq phase, so
->suspend() keeps the virtual devices runtime active, and the runtime PM
calls of the blk-ctrl do not fail in the noirq phase, while the genpd
core powers the GPC domains off and on through the virtual devices. That
requires the virtual devices to be suspended after and resumed before
the consumers, which is what this series adds.

Lucas pointed to v1 as the correct fix in the original report [4].

Tested on top of ulfh/linux-pm fixes:
- Verdin iMX8MM: 20/20 suspend-to-mem cycles. Without the series, the
  first suspend hangs and the watchdog resets the board.
- Verdin iMX8MP, hantro-vpu and phy-fsl-imx8m-pcie loaded after boot:
  20/20 cycles. Without the series, the board hangs.

[1] https://lore.kernel.org/all/CAAPs2HTo=4+AEw1+vcU6c9vt_O2BfF+gv3FFvx9G3KLLzCOsHw@mail.gmail.com/
[2] https://lore.kernel.org/all/20240418155151.355133-1-ivitro@gmail.com/
[3] https://lore.kernel.org/all/CAPDyKFr9Vzgm2C6Z57Bg5mUQxg5LK6goN2og3+RC3BkTZjiqJw@mail.gmail.com/
[4] https://lore.kernel.org/all/8636fb8d9809aaafbd8274ec0dbfc250e1113c73.camel@pengutronix.de/

Vitor Soares (2):
  pmdomain: imx8m-blk-ctrl: fix suspend/resume order
  pmdomain: imx8mp-blk-ctrl: fix suspend/resume order

 drivers/pmdomain/imx/imx8m-blk-ctrl.c  | 29 ++++++++++++++++++++++++--
 drivers/pmdomain/imx/imx8mp-blk-ctrl.c | 29 ++++++++++++++++++++++++--
 2 files changed, 54 insertions(+), 4 deletions(-)


base-commit: 458777762756acfc7d2c20067cca6cc817cc8dec
-- 
2.53.0


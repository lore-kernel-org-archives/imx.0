Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483601;
	b=jaxOrolTFWiZ7vueef08v5ApOs8OUxXRbMnwtRk1YuVRNnk5UjX8S5CwfAb5Ooh4ggsL
	 H4wKusfHzp2V3yN1hJRBH7Kmhijm3kogd9sa1c0a7+QgYiEgcoSaTUsJw+K5yvymoLFPD
	 Kz1n+OPe7PuI6gbxPriieFcM+BOCvFNMz44gDKcIWmU8tMDiTpgLY0KV1hRoFunN6oq2v
	 AAVR+yQftBpX6pL96/nyeApaj5Subf5ZXqbtRtnNIy/ZWu6AT0qg4EN1qdef/dPyiekFW
	 7UUsljIKbNfAgUzFE+T0m4Kct81fzz3fm4BDB6QL4DMDdD6bYpvixZmmYG2opb7aBSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=uAkMK2tRWJvVq1ApX47OvdLFJWtUKDboSiivt2OouPg=;
	b=cgbmZvhR4PTofRnZOEsV9CXJBczyrXB6lH+Ft6jbFYxqXz36XQHuzT2FM8NtR+G0Hrv/
	 8oNR4+060IPEloqiux1fikABOGmsU4SS5xSZ9EMw5bnZE6f43euc/4ThYLv4aj/qTWjZA
	 uTfEkcnUoDxIq0bB+DjTEMBPeFSPDUUKCHZnpz72jfhXkjhtenCa7WNCmf0BZJeMgj6MC
	 vpH7x7V2Z/FmhlymHiodeIL+ob3VH9U7hNYdRt64U8tNCBi22cnjZhEU0xFXTPVfXKuE+
	 whCK8Zj3nQut7C4E+o+LW0pIK+5tTGJzlnrxU331JAzFRkdf7WFNHRJyoZh1Lkl6CcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Wq6dCMzn;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41D9606A888
	for <imx@lists.linux.dev>; Thu, 12 Nov 2026 11:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B41D9606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Wq6dCMzn
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so38766845e9.1
        for <imx@lists.linux.dev>; Thu, 12 Nov 2026 03:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794483599; x=1795088399; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uAkMK2tRWJvVq1ApX47OvdLFJWtUKDboSiivt2OouPg=;
        b=Wq6dCMznanCwWqtSnFpUzbSk7EuxZpPW6zpaBpqjSYv80kUFqV81O7ZALmoZglB1tw
         8wCs9rDS49kXJdnTIzOdplU+e6rCIt/79pK9e/VHMRlxd+W4/Ag7egsWZwTmh8YibTgc
         CQpR1l2O1UDa4GvBNvAZN/cVWhZjT9cqwWdGpWXVVMIWJAr81dye+tZ9jcetA3NICE4q
         VApIZCtQlhMSz3AI5Yfz8Y/gIYvFFZME+Ii+IpIYJShDmT4a0Ov3emrQi2OqR/E4jcMV
         UCxm9gVuw+HPizEwByDj+/42BiNRRDLzGXtMIsKMka0Be9AHGdBmBsYk5hZACYTLlf9i
         8DYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483599; x=1795088399;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uAkMK2tRWJvVq1ApX47OvdLFJWtUKDboSiivt2OouPg=;
        b=esArP303AXCyE0ix37r6Vxh/hNBRUoHxifcdR1jEH1WzrGJbqUJxfmeZJQUFbbEw4F
         sTwtntekiSOVdvECIBFWBYiH44BKTBiwEbQxswHRRzJguzhRR6ReBt/VgwW6GguyFuiw
         rTMGkISw1LYt9xbllNB4VmFx+/HLg77SH5nMjGmShviSBhkLAO9iNWF0ZHmyqYHCEItw
         yHVzwzkPm+8tQKJ0LLjJuTsX5V5xPVZPHqf8AxfsWuNaBye/gAUj8bzdell/lbK3mblu
         LOBZ+hd+zp3GOw3sXVZp6EHmSeS3fW6h690KP9Z/uJvdYzbyXCwuijNmPqeeOoBxTAw1
         HYew==
X-Forwarded-Encrypted: i=1; AL+hErFe2Eooo1N6uVixZHW+kf2UyxC875wgzPgLuWC/3miM0c/q1AiIKJezcTEBLe0l0mEfY/Q=@lists.linux.dev
X-Gm-Message-State: APuU4Z/cx2VSEA9v1aQIVUdWimSl2rYZsVKcKhgUFVPc33pr84B0Gy50
	stFZ6brasOp+hMIBkKvq+7kLCUkl+QfbvA9TvNwMIpradIK9ycM6UydGQ/TSTq67zysse2LjuAC
	4hYknPfA=
X-Gm-Gg: AYBFou3NSmQHYvxYQWkdLTvS+DtY14/5U98mBWYbz66VrYOwETA7DMGx1SyCXXdZ7tU
	oju+ZYWf9cLvz6pK1aO3fG/Y/Yk/x/Tz9qCY8CVYosF4B4QwX1Bnpt57YUDS6RV4hqZLJQXR5hR
	jPhQP7kemiDU/rw2WG44GGhpdCR8FpvzhyNxDTCr6Km0smt6EDYY+QA77Mm1vA6Uri++7OytOIj
	bmFj6pkkYRl0cSp6D++mIijQ25HA5hk/wDIpQDS+D5FITqPwVGJXLrt6m6dyziffcBjuwZy4iFH
	flp0nZBC5KHKqufQskh5Xfw1A/xEJaOzfbiP8On/XhZLFKTZNV4ZW+TQxYt/C9Dr92dFGt2i6Nj
	COVrr2+qIiGhxJyeIJjSxqYDxKgLxFJE2mCfEMDFMMdyhG5QgvhZ3b7fI0vNOTAdRBlVR/8Y5n5
	o7lfZluZunXXmFamgMQ4qlDlb0rmvOB640I/7xBZFmOP2hBPVLrdmyPtRxXyyasM0lK1Y85Vgmp
	vsPDvy115ujxDqiKQ3OXU62qXkmFC1QIlli2Rrpy7jnLXpcwmJ8gKBSwL+gDtgIJ4W+0vqh6D/3
	0Nllk7kaOrkPZsHpgGCLhE5G554/k5vPDwb8bDe3vjJyzHo5gnVvUQ7WuJsK4wY/X0jz+60wvJ+
	f2gdcLz47qx8hiXRW
X-Received: by 2002:a05:600c:4f81:b0:4a2:180b:3153 with SMTP id 5b1f17b1804b1-4ba093605c2mr91136455e9.14.1794483599210;
        Thu, 12 Nov 2026 03:39:59 -0800 (PST)
Received: from localhost (p200300f65f19a904528996c8ea0fadad.dip0.t-ipconnect.de. [2003:f6:5f19:a904:5289:96c8:ea0f:adad])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba09509c74sm72110275e9.2.2026.11.12.03.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:39:58 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] remoteproc: elf_loader: Make rproc_elf_load_segments() more generic
Date: Thu, 12 Nov 2026 12:39:49 +0100
Message-ID: <cover.1794483181.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1100; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=rpD3ZlQEIotpmgm/8a/F0GE3kt8iCsrVMvUNk750HQI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq9aV0VygZNHI2SVH27/dYSxqTJjDlywp4XNFMf BZVY/583XSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavWldAAKCRCPgPtYfRL+ TtCQCAClGYs+wv2wyzDrk/79LjPZbrJxNoTbgGZjAjNL8eGW9gHs8Qtu+Ul38KB+Yvlx4MgtF/v 68QyYlSMuYHXaQbGbOS3caVOpqAhhyFW9mM8PzK7wng3qCpRW2IfG4zk8sJ/b7sHISO5LsW4Q2Y jq3i6lhqo2kiw+dw7eJbkLOANZ2WciwA1jE12N3J4FGVwH2cLPWqU99eaaiq2jvcq9iKdY8wF3G DVlNZUgZMzYirkj6IRVOAVLsmMDsQs6BRWvaWplf/mr1RgAw0UEx47fAFp0XNesIZ3AoiCpDO5F Ee1FjbOjYKH4bwaNPe5ccJau4Aiy8JQCTn6mUlgyP1PvkV3V
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

Changes since v3 (available at
https://lore.kernel.org/linux-remoteproc/cover.1793879714.git.u.kleine-koenig@baylibre.com):

 - Improve kdoc comment for new callback describing what it is supposed
   to do as requested by Mathieu.

I'm currently working on another remoteproc driver that cannot use
rproc_elf_load_segments() as is because the remoteproc's va isn't mapped
into the local CPU's memory address space in a useable way. With the new
callback the amount of code that must be repeated is reduced, similar to
how the imx_dsp driver's load routine is reduced.

Best regards
Uwe

Uwe Kleine-König (2):
  remoteproc: elf_loader: Create new callback for copying segments to
    remote cpu
  remoteproc: imx_dsp_rproc: Implement .memcpy_tova()

 drivers/remoteproc/imx_dsp_rproc.c         | 120 ++++++---------------
 drivers/remoteproc/remoteproc_elf_loader.c |  64 ++++++-----
 include/linux/remoteproc.h                 |   7 ++
 3 files changed, 74 insertions(+), 117 deletions(-)


base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
-- 
2.56.0.rc1


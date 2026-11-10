Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308089;
	b=PHrK4q/RtXwE/3S7vzoI/Csuq3wOaWBJwQBuCnmIN7VAvWPSefPtEU5aNnpU/SCa6mMe
	 BbcFZPBxApnKci/27/y8JTMxD+mRX8TmmNBT4i1UjWqzNvYC3z+vx3UPxGbF4PVgaYJhk
	 U1ervTiFx/iZEXgJuq/qpsgMws/tGf8XDB/6p7x5YEiYvmcdNDiM4dapWO+PHPjWJ4Zfb
	 G5DViEtYwHwf9aRozyEd0zfAiC43GEWK7v+pc1SMCM1XxTGTsnJh21l8os47r0i0OR0rJ
	 zxONJ6BnptbqlVDIyY5wbZErlATbSzDUE3wqOAiP6AgFznWDBuoCMs8lKn/MsQDz/Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tepxdS3pjiqx/ESdTVnng/n4oyG1h1s3ol01nQq3JzE=;
	b=m7PigcRfjiZCr5a/qGi3N/w9+GaXMnxYba3QZAT3ogBnyH15r9fjfevqNj2Yla/lScsZ
	 T4vKwC/RDyuOE28tr1DbmpdBXywdorbCZqbxFsrexyFh/Raoe3JqUGdCLvx2BnQY8yCqs
	 E84QGkS2YOwMDuCwHjsYIYyzBclLGvuONtw0zXBbudbFF45QY8wbI7CsMqltOTfry+2Bl
	 2dylCoY0p9tMg5vpF0wZe0QsTjdl6HMTvVl9/b5Bh91wH+asz9+tLcwVut5sV6fIa6yqP
	 S0LXk+DMEQk0X6PVaH+nJ1pfVfDBxTiKZ57xX6eSfgVWDjsg4z3wA08M2ODtVhL2KHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yJGh0ydb;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA20606A321
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 10:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEA20606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yJGh0ydb
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a2af4c8d00so536056c88.0
        for <imx@lists.linux.dev>; Tue, 10 Nov 2026 02:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794308088; x=1794912888; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tepxdS3pjiqx/ESdTVnng/n4oyG1h1s3ol01nQq3JzE=;
        b=yJGh0ydbeBMdsxw0mwMBuHC/slzHiwvbyvPDFywlNu+Kp5i6mFXimKBlhqKWHmwV42
         prgmMOkhP6SPXm3I/c+BVzCrYrjR/TEZNef+nE57zIV3GEPWGmDi+knGd5aeB3lQwpAL
         xDuoNOy21Xx7h47Ecu0HHgKWWNoNU2agW8dbH6j90MXU4QtfhA0imTyUq7bswbooHPYl
         1AylHH/Yn78o4NokR/L8dCXOWbq1HEbrj+9QC/0tkjDew2+zQLJbKnU/hyhsQUWtMMm3
         jv91rXHLVhWOCbFPuC4rPgXkNAfFUkp6Qpp74rSq50yIDhwcLCWfvfGK3xbXT5vz+hf0
         SLlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308088; x=1794912888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tepxdS3pjiqx/ESdTVnng/n4oyG1h1s3ol01nQq3JzE=;
        b=seilnbfpaTtm/54zhWK9y3ipntF0llIzHcropuljMn3WU+gbWW+zFjmvOiwLZ6kCxY
         73GHTHtKWhA/anP50HtnH4k7C3ef3MAnF1JhszPj/YeQ/7RMSTQU102hlDZrm4j78Vy/
         YbqgNjbguIVCvf0Oi1JSKag3xhSUbg1b1s3r23pPR4IzxaSCuojc6oF/8IjO2FfKf00V
         XS1oAgw7n4XhHHWkSc57+ZAZVBs1hzpq/7JNZ05l9lMr+HJPOlNg6grkr1qNq9L6yjbE
         XJubIBYALKGKyrnkHBw3+o3k64x6uc5f9oqs3OwR5yoaKQ5pK31lV6KAc9Tr8IfjXLuA
         KGlQ==
X-Forwarded-Encrypted: i=1; AL+hErGW/rzEmMtJ8Sxu8xz6Rq8HL+qHwoiTbGjZ+P8wo1vtcKjfYlIEJ+9QeXnRRbo18Ql7GoM=@lists.linux.dev
X-Gm-Message-State: APuU4Z97oPa4qb77w2VxOrBLwTh5/4ZwXpdrGavfQ76V5ahGs8fCkPbq
	rLiX0RBu+dEWc/sGnLFT0j5lHewiTZZ15kxPOUf1wWrAWQfgtSEeo2s9
X-Gm-Gg: AYBFou0WGJjLLhqW39b9D8Bs7xSs3oncUpASibsnvHluxtTL97FKE3Ie690DBwF9sn7
	xELhC+nQ1SlSczivc2RPGw7BUmKPnw1w3+Ft4wQJai2oXCbZjICoLRrex3bx14UfVo3xJv/TWpn
	XgX9sV2Xh7AKbSZonfYW0Ml/JH109DZ1TWAofxKOrEf00zgHv7JIQZ+PBIBTRk3evu+EZz+t7kj
	voIYAX5kZiH+obUTeYk2STsqe6NVFYCPyttLSuQ9EdqXoy/h8RMZWUh4H4GvNf1vY72/IlXgxtu
	nlyLnoj/AkjML+yg0PyTl9JqRm5APhG5AxJZHwupzM5dXTZHY+IUSaLLHGI60JbyqQyGZaiRv5L
	gyEAF8qe/rMwMwH0XzD3GE/paBN2Uk+su+TgefukNQDtHwTIWompz+BK9KYEHFttzVYKkMHF9NN
	WA247pF65BTDC3t5CbkmQ2cWm/B34dPJJxzFMwokhs7Qaq8+ShA1gcClrnVTmC+Bj4WgFInKfLN
	ri09MMkgX6KKyeoYfOg3Er7UGOvmUjbCWEK8gSvQ70FTxCLAX5k/CSmITHgFqPMzg+34uTly9i8
	JWvHkk8kXYDpcb+kVhZNoLX4DFvtnOS5WTRN/Vv3LzzT9ycE
X-Received: by 2002:a05:7022:f50a:b0:1b3:a9c6:b293 with SMTP id a92af1059eb24-1b3b6077440mr2856751c88.25.1794308087698;
        Tue, 10 Nov 2026 02:54:47 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm6996923c88.4.2026.11.10.02.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:54:47 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] remoteproc: imx_dsp_rproc: drain the vq work before freeing the mailbox
Date: Tue, 10 Nov 2026 19:54:36 +0900
Message-ID: <20261110105436.2487822-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The mailbox rx callback schedules priv->rproc_work (imx_dsp_rproc_vq_work),
whose handler takes rproc->lock and calls rproc_vq_interrupt(). The work is
never cancelled: imx_dsp_rproc_free_mbox() frees the mailbox channels (which
stops new rx callbacks) but does not drain a work the callback has already
queued.

free_irq()-like teardown of the mailbox does not wait for an already-queued
work item, so a rproc_work still pending when the rproc is torn down runs
after the rproc has been freed and dereferences freed memory (rproc->lock) --
a use-after-free.

Cancel the work in imx_dsp_rproc_free_mbox(), after the channels are freed so
it cannot be re-queued, before the rproc it dereferences is released.

Found by static analysis; not runtime-reproduced (needs an i.MX DSP with a
mailbox message racing teardown).

Fixes: ec0e5549f358 ("remoteproc: imx_dsp_rproc: Add remoteproc driver for DSP on i.MX")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 96d619d..89c72d9 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -642,6 +642,13 @@ static void imx_dsp_rproc_free_mbox(struct imx_dsp_rproc *priv)
 	mbox_free_channel(priv->tx_ch);
 	mbox_free_channel(priv->rx_ch);
 	mbox_free_channel(priv->rxdb_ch);
+
+	/*
+	 * The mailbox rx callback schedules rproc_work; the channels are now
+	 * freed, so no new work can be queued. Drain any pending work before
+	 * the rproc (which the work dereferences) can be freed.
+	 */
+	cancel_work_sync(&priv->rproc_work);
 }

 /**
--
2.43.0

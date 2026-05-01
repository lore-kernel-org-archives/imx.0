Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3543C063F
	for <imx@lists.linux.dev>; Fri,  1 May 2026 14:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777644005; cv=none; b=SupTN2QgAzwi/dwZu2C0jJa5RI75HE1u7YbffHjD4tbUdShEWr4VyeNfcBRTWo839Zeow4HvNksx/91GTDxgt80dsVydI54oABh3Hh2+y8r7nBay57TZ7Xpc5HCGNlhop43AnPKML1z6lExCyL42BOeV4Jopf1d+sHedodw6HQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777644005; c=relaxed/simple;
	bh=jJjc9mSsrPx/NmfZcqGL2yYaLbyjJmbr1/4K0E8A+5k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZuLaG6l1qik9kdtsCA3wcQkZYWulcXwaU78rWLn7IDbxBOwjVHBTzHSBw2ZGiim7kosCL95ztscphW3IZIIRzTEtt5KqJAiv4kpqljVQDlqG4gwpN+xdCAiUtY4WhCwgheRIvRD1uvOB19FzFkvfZa8xfg4mN/EynDr2qpFqJ+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BCuKS9D1; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BCuKS9D1"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-44509921fbcso1050126f8f.3
        for <imx@lists.linux.dev>; Fri, 01 May 2026 07:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777644002; x=1778248802; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgCd/8OCqeyYKCVUvRrf/jlOcP1suVHYVb2aR3GPrKU=;
        b=BCuKS9D1zKbQeyhEpehyhuKAFdqcVsni6AOmhKuH30LM2FD7+p9PZtTqocmpUXTUve
         lFhAemyqOmIMAoVZSL993FK6E/TeqOhD/OnKUET90YKFnySyibwpIZp91gn7kbIfogBd
         DfUEUS72O8AJ41ZjzLifvanBoEfPltntJTsb3gX8ybpF/loFHJYUC7r+qumFSs+JFUsT
         135sYzDCpfDsPlfMiCMF4ZfLzK1k7Vm0sZGyhsAN+xyAgEAyb02ril/M7lMsJWzRbtQD
         UeoQcR/vc/q9FXkQnng8Fqvx5K1CSaeOAb8omwT02z5QUpPf0mX0g3ky5cd2NvnQThf1
         3cuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777644002; x=1778248802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wgCd/8OCqeyYKCVUvRrf/jlOcP1suVHYVb2aR3GPrKU=;
        b=QngiFW/bl020gkh9/nmfQa99OvFy/b/U2sF0o+SUzfUspWz1JG8m83CXzo6QV3j30v
         Nm+NZfPPxW7TJ0hz1B0mrl5Nbg3TOuxCAKvstAy3hOvLGfRuyTG79mmQqgX1vQXSvQ11
         PXlH6kVuPI76us06ui+q/kLN+kFzsy1lSp/BpSpeNYwJD6sszOwNr1eV9+nZSTAjCcbX
         xXmFNIsXCxPRwB4NculAwlnL1T0N0su50BrSo9+JPle0Yt1uDgsbBNrRSqKHz0B7YW2a
         HV9EzETxqdtbmTUaLQJVc28obFMRehHfw5M3ge3YzDzrfvwChUKFFLpNHZD73y4YFavQ
         nduw==
X-Forwarded-Encrypted: i=1; AFNElJ9nWNdjMpwZveoIGRM0bfhq2C2Yn/V+lTsrv6dwXBZJEs6ggPOj37+VlEKhlJXN48TJp68=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7VUAvczf3OEJR3hdDRAAAjSCg9pUsa8uL0xZPbdikJ4aFditn
	/3v4LBzWkpmbaDGT1mhfHJ/g3PkKoEWrCgSAG61GfiVJISbNHuMQQR2E
X-Gm-Gg: AeBDies0v473LkOtdO2k688A4LrnOWBhZFFQ66+fQNMpCtxdqzN+ouELMguLiJAjEvG
	NfPdRXyUfarm6coyKz+K+u2yTcnC/oX3UsOOrQo/b6HNSXS/42QoFVY7fkmw0diL+LxDGZ7LCEU
	NiAROoOlkuOTzNxbHsQgb0TtJ5WpWlVIVj/o1XgyfwjxD+OyfouOSEg5Vjt8CLLGQC2yI9x9UU+
	3kS8uAdU4pIVrJrATqi3wwDs+ScGHweaFWkBKm+Bk4X37YulHILb53LQcTb1cQISMfX1rWiNldR
	3eDKqUU/Zgb8gJY0C6yFhE9unMFkMBtW3aXmNYRLiX21zbs00weWQWa1cWLeGam5m6HsG3m1t4C
	BiL2SfAi/amzxjTRQYvICeSNRboITj4gA7Mktzbarcir1ngaTe1cngJFHwrF9fMTffMeyUdwz54
	tbkzH+tlJ2m17A7dZ3rt97TKHc9Iaksxow1Ro9wb+HwNNm4Ru87HxbXeF772ZHewYHdffpd5gHf
	sR3
X-Received: by 2002:a05:6000:2b01:b0:43f:e2b7:7160 with SMTP id ffacd0b85a97d-4493cf2d5e0mr7464637f8f.4.1777644002422;
        Fri, 01 May 2026 07:00:02 -0700 (PDT)
Received: from localhost.localdomain (ns31537009.ip-141-94-163.eu. [141.94.163.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a98b768fdsm4823539f8f.33.2026.05.01.07.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 07:00:01 -0700 (PDT)
From: John Madieu <john.madieu@gmail.com>
To: broonie@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	carlos.song@nxp.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu@gmail.com>
Subject: [PATCH 2/3] spi: imx: Fix UAF on package-1 prepare failure in spi_imx_dma_data_prepare()
Date: Fri,  1 May 2026 13:59:50 +0000
Message-Id: <20260501135951.2416527-3-john.madieu@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260501135951.2416527-1-john.madieu@gmail.com>
References: <20260501135951.2416527-1-john.madieu@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When transfer->len exceeds MX51_ECSPI_CTRL_MAX_BURST and is not a
multiple of it, spi_imx_dma_data_prepare() splits the transfer into
two DMA packages. If preparing the second package fails:

	ret = spi_imx_dma_tx_data_handle(spi_imx, &spi_imx->dma_data[1],
					 transfer->tx_buf + spi_imx->dma_data[0].data_len,
					 false);
	if (ret) {
		kfree(spi_imx->dma_data[0].dma_tx_buf);
		kfree(spi_imx->dma_data[0].dma_rx_buf);
		kfree(spi_imx->dma_data);
	}
	}

	return 0;

the function frees the package-0 buffers and the dma_data array,
then falls through to `return 0`, telling the caller the prepare
succeeded. The caller then dereferences the freed dma_data array,
producing a use-after-free.

Return the error from the failure path so the caller takes its
existing failure branch.

Fixes: faa8e404ad8e ("spi: imx: support dynamic burst length for ECSPI DMA mode")
Signed-off-by: John Madieu <john.madieu@gmail.com>
---
 drivers/spi/spi-imx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
index 7ae8078c10ef..4e3dbd01d619 100644
--- a/drivers/spi/spi-imx.c
+++ b/drivers/spi/spi-imx.c
@@ -1709,6 +1709,7 @@ static int spi_imx_dma_data_prepare(struct spi_imx_data *spi_imx,
 			kfree(spi_imx->dma_data[0].dma_tx_buf);
 			kfree(spi_imx->dma_data[0].dma_rx_buf);
 			kfree(spi_imx->dma_data);
+			return ret;
 		}
 	}
 
-- 
2.25.1


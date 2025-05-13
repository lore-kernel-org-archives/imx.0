Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF971F1932
	for <imx@lists.linux.dev>; Tue, 13 May 2025 14:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747146224; cv=none; b=tWddt6shKSksI8BKOZEWewQ/zVsnpMCtpeAVzso9DQEzmpXv7819K3qjgrPL17wgt/XR7KuriFYpq7rFuir4rVTPYmTfhHMYECT8v7Gdgp7nIZgiujsguArycGZO5i/uZmNCpjC45GNCdqQrpaiuMEFM29XenYV1STwH/obNBpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747146224; c=relaxed/simple;
	bh=oT6XNM77B8+ium9Cx4cc7TioAAenrUX/vpKuFTyATHM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=me02ZnieokyUiql1/t1YASWnbgPJxtsBCcntyrSUrYKuJgOjv2C+SRDXNmfe9I/+WCuCbMDdUHM0BQN0nAykerUxleQ+xSap3mh7d+XqNowO4hSn6u88MS+ikMO+BO83eR5S3vZzGZJdY+IlTzz7KoPrTQ/7DlLGtIZ7V7fkz7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lDDsvbgw; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lDDsvbgw"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-878627ac2ddso1375822241.0
        for <imx@lists.linux.dev>; Tue, 13 May 2025 07:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747146222; x=1747751022; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0l36qpCnDAhRnaTWedEaUZwbfvZPD7EM2qytUdMEXlk=;
        b=lDDsvbgwQ/Taxrp9XJztURAQoGOvPkEiCquY0JcpvLmoCv+vzdeXvIWd0hnsyVYPCK
         4xXGRxRFUeLFHOuPKQqQc9uCss9bCAT1dPbDHNCyDeWx6SAkV6wD+zXSk0V5DUNncICT
         RDPK/D2Jcdm25Y/GPFsTAaJy6HUWH82iUfGcf73pSmVVc+X0tZm4WTrMUCMebymyF8eQ
         bAUljFAIQEzEKX1Qw3qYD43JvszkDvtVRqsoNOyqrCnHGf1o4iKdK0SOdxdTD/fOIAcZ
         RzDKFSEVI+Ll+jGdDNjzOTHBL7Pjj0g+5PmkkHdgwdnfOfREX83UIl8FRiczpOz6AQS5
         OzlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146222; x=1747751022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0l36qpCnDAhRnaTWedEaUZwbfvZPD7EM2qytUdMEXlk=;
        b=e23APGfA++wwJISritdmEt2vUMiutXaJSbSSRCkxwZ09X41rD3yWc0TCHDDiwSI3pK
         Dp9rz34VVFGW5mA2/maRHO4BqutSLjFYFHztET5b4QCy7PmJNDhnycxJGwJlLOi8aHmV
         rHI+yjojtDFBG0kxfcGO1FkPelWr8GJn2/XqoHwV9jHD9Dopj8v2NhlxT0R3hwY17JrS
         yL51AoS8wY8XhukGp60UDpcPD86fT+N0ZQ1ebv9/cH/WGmUx6udMvW0oymiROjmmKI60
         /IReVe17lvT0CpdYwSJNqH6KQ3VjGdPoaQKnjum4mJ+pdECP7YC3L/wm5edL3B2u5zra
         ZTkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYqo8ohgqxsjy3zW9i5RmxxMN/TigklH98M86ZblF1COOYinCX8LQAAX9/LZB11c2SFLQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywg2K5/fRI9tnNXss6vy21PaQOWh9DMyaUYnRZ5ZbmQ9wR50ooO
	A413fOWF4CcrECqEU8lOZS55XvxSgNBFGxhWl9UavipFz0aUdxEl
X-Gm-Gg: ASbGnctIBbzZg8H4f3YC06RzpUOfU4tph9TvulcN7x56MisOS/Av3lHV4UnxqMLZdTW
	2PR0DGFBqg2qcjF0mqMwBbK7T1SEpqFcEC6OEHowHZxdOTOwYN/tNsEo9aB/RhfWd5C+WGFGYZ2
	0HhEhet5L3zfHxKGPx3P8hdzLeEspXqprb+YYBKN6Znjz6AoIhoV8D1APTFSijM+/6r+1Zs2IbG
	no9T+1HqqklSjSXx0K3NEaApr+wDI9z4EOQfTP7xD1x0s77q1jnJauMoqxGVCLPGFwcIndB6ZrB
	m2WSKPcWcNNHJ94FOVNuWNrv+pusAHd2cG5vPgg8qpx23nKxZBsx4JeqQAvO+Fo2rA==
X-Google-Smtp-Source: AGHT+IEPnMB4IboXCa/1FdqFHavEmkJxVozv+Io0Cs9hnebsXUci5GmVrdypDMhC+ZsSI0YngK2PIg==
X-Received: by 2002:a67:e7cc:0:b0:4dd:ab6c:765a with SMTP id ada2fe7eead31-4deed36dc90mr14572810137.12.1747146221656;
        Tue, 13 May 2025 07:23:41 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:5c18:acd6:b894:dc8f])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4deb203c26bsm6630965137.27.2025.05.13.07.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:23:41 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 3/3] ARM: imx_v6_v7_defconfig: Select BT_HCIUART_BCM
Date: Tue, 13 May 2025 11:23:20 -0300
Message-Id: <20250513142320.4036324-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513142320.4036324-1-festevam@gmail.com>
References: <20250513142320.4036324-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Select BT_HCIUART_BCM so that Bluetooth can work by default on a
imx7s-warp board with a BCM43455 Wifi/Bluetooth chip.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 062c1eb8dd60..6f62d2e96239 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -68,6 +68,7 @@ CONFIG_BT=y
 CONFIG_BT_BNEP=m
 CONFIG_BT_HCIUART=y
 CONFIG_BT_HCIUART_LL=y
+CONFIG_BT_HCIUART_BCM=y
 CONFIG_BT_NXPUART=m
 CONFIG_CFG80211=y
 CONFIG_CFG80211_WEXT=y
-- 
2.34.1


Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FB2288C1C
	for <imx@lists.linux.dev>; Wed, 16 Jul 2025 22:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752705990; cv=none; b=GdBDRAuAFeLoaWR5rs4WnHZF4gz5xscBbdSZPoIsjiAeSLzYNIng3hByRgvaKx8xpOi0LG7tjz/BNL5R0zlbJOBos9eAt0kstScOZ4oAnBMvzUK9lygD8TdI6EtK6AlR/F6PtYelIjrPfpl6ooz8XEODBAfPLUMv82dtqADTUpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752705990; c=relaxed/simple;
	bh=R+Lhq1vCYha2kVC/gKYBwgMh0PCi0r6MdFv+dfqI1y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aYVGk+iu9QJ7E+U/xSLe3h5AijGmdz1iX3j9P9GBZpokI7Oa97EjjOF0KNl8+dbLt3aOMMCw++hd3nK4vZzbiMFCpzi9KKFozA1gMSnLczOrarqcLq3V7GqxpsaDBZdKF0ZBnuoYbDuQihrr9+k09cZIJa4mVVbP8KA2AClCsRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W5ItkrHl; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W5ItkrHl"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2ff1ed124deso245580fac.0
        for <imx@lists.linux.dev>; Wed, 16 Jul 2025 15:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752705988; x=1753310788; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LiiyQhkDqEe/y4fMk89A/2LpiKkeCtnb83PrX3E9ODQ=;
        b=W5ItkrHl9/G71xfE3bphEzo8e98e0u17U6THO6BZMFAMUtpZSBWSvQZQdz2pQHzVJL
         zH/KG0Jj6z1HEANX2vM42tw0G2c0HPnuv0jtSB2D5G/gyEhgMkSinfHmVkX26Yt8zJXc
         0N6GPlMrM43gh5xbKR1umqdYktA95xCkAc0p3Fn8ufPFCnHfDSzLhAV/HwG71iKDzCfH
         hQjiOvroffvA9SnTh5qM0+D8go3B6RgbHgEZQWULPpMK3Co/UOX8UVZFrfnricXZF2Wp
         hb+rSS7yYtUWSzAW2IECXSppvbez1AJIZpNLYSRehYib7uEFZ5e5AzjkRmZzPjBdirsz
         KJuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752705988; x=1753310788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LiiyQhkDqEe/y4fMk89A/2LpiKkeCtnb83PrX3E9ODQ=;
        b=wHcv/kysiFJHmq1nwTyag8RJDD1DA2sd5Auht7OAx4DV3IneJytS+1Ita1Kc6lL1Lw
         qGwIpjuoXLDywjYE691pxh0DiW0bxGfWhgSUsPNz86Dl1mIDEJYsYAVTHi4A2rEyzT7c
         2ilYotz1f5VCJwgvgeKKe73NEovQQxnyV70gAqTQdzuRqSa+LfvAygBZQEL7P/SOOg41
         vxGNu0j4ni5ZHYGFfSHFLQgYKrMsp2OXb82MltgKAHSTIxdfwIGWD/2RolfuQIbUa1ZS
         6Es4qmWkgHfpb7lONAKNRp9ckJftagVjGyILiYdMgSmNX9QIlzqa9mR2DjtldjPQPxJz
         +9pA==
X-Forwarded-Encrypted: i=1; AJvYcCVWuqxpbwqc9GfUKZfljghYJ4p9Vnv9yNTO5hxJIFSHJ/EpT2ugTFy0ONXDZrXXvZ/XT9Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YyuU4Wn9v5oAgiy4gh5E+5u4IF3MpUn/nOgUrCQJOkxhCrxcLfu
	G3PWDKM4vBoH8opqnfkuuThcDLklewJ9PJJjMpY8YeGm8iVDVbmMzxEu/D5KkdPnAUY=
X-Gm-Gg: ASbGncuPTOVi1mkFwphsMtLL0ncs0fLJvHpigHPiV257Sw/tFXUOaLtGxX3baMBTgYR
	K43wirigRH7B1Ea0DHam4Qgu75QnHr4CGivooP/wpcMrs/CGYB9K5vih3WLTxCO1qF4+N5afSj0
	jnfj0c28VXy7rcS79WJ7mMDMO5R7ZH2fcZj/QKqH94pA3nhGdAZWxq5m5MnyhSWuCGN/Kvvye2M
	1SS8xtNTi0IX1MLFMmKED3J7YrPiC4GFwyQ34qJHAie8rhmvTulqGHEz92P6RbSwiSKlrkLb3pY
	Byh+q2DplvP2uQy6cFutMiZaEqsNEYXFYVLdF9pkZlRFEWhgMOg/fSMJjlGi+DybCJX1Acgattt
	Z5mNqzFfcdE9wBhxoXVaklQVkw6+htg==
X-Google-Smtp-Source: AGHT+IFOGaMrw9AqIgbXe/jwkCHgKj22Wqht7XROv3FQmVROEgsFQIi2GM+MArU/0+grsGQkVTtJVQ==
X-Received: by 2002:a05:6870:e412:b0:2ff:a860:3402 with SMTP id 586e51a60fabf-2ffb229c2b2mr3886783fac.12.1752705988172;
        Wed, 16 Jul 2025 15:46:28 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:3f28:4161:2162:7ea2])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2ff11681bcdsm3928163fac.32.2025.07.16.15.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 15:46:27 -0700 (PDT)
Date: Wed, 16 Jul 2025 17:46:26 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] usb: chipidea: imx: Add a missing blank line
Message-ID: <36d1c961-319e-4457-bdc1-69f8b6bed33e@sabinyo.mountain>
References: <cover.1752703107.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1752703107.git.dan.carpenter@linaro.org>

Fix a checkpatch warning:
CHECK: Please use a blank line after function/struct/union/enum declarations

Reported-by: Xu Yang <xu.yang_2@nxp.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/chipidea/usbmisc_imx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 0b8b980409bc..3d20c5e76c6a 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -1118,6 +1118,7 @@ static int usbmisc_imx6sx_power_lost_check(struct imx_usbmisc_data *data)
 	else
 		return 0;
 }
+
 static int usbmisc_s32g_power_lost_check(struct imx_usbmisc_data *data)
 {
 	return 1;
-- 
2.47.2


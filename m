Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA9F31AAAB
	for <imx@lists.linux.dev>; Fri, 16 Jan 2026 09:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768555518; cv=pass; b=ml3AcnevseXVkekh64FvmHRyqyowuWQ/eFmLPj/kTIcJXWssRJZscO6aSNlqQ7vEGMn+LiTJtXTksk7CqZg8Dw0tDkZUK1+9NQhAMeHQFpIXyds6pUSSStOiMaME8ZIFApoG6OU/tqK7eWo3GfG1UYMsoH1IorZ2eEI9hGsD9ok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768555518; c=relaxed/simple;
	bh=2kXTc6rtb1n8msxIhzkYUgOALIZz59Pq2CxmSyGP5mU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ffoBI95yB6r3V3iZd4FutYjtbjeCw+Y2hhwuKyR/UagFyrJjaFZSIMCTlj9nliFEwf0HT8G+i9FyR+xhZE2kX4TfRnH6kjDwT6q/ELk9xeUBKHcBW0J4T6mWX19BCm/D+gZLgdTz0u2CDTzxhoay/pLZk9j0OJFV/QykWKZLtbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WPdd/WQ5; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WPdd/WQ5"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1233702afd3so2305430c88.0
        for <imx@lists.linux.dev>; Fri, 16 Jan 2026 01:25:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768555517; cv=none;
        d=google.com; s=arc-20240605;
        b=U8emzCAQBclRZ3p06eNWVkkB3KrbSC8BBzFYJM0Q2yhHfvh+uumhD/j4SeAbqruYIu
         7I+kAUxd/M5GCe+wnaBSE6EPylVzt8aIY9qZLQFjSWyuFSsf9ShGxbYZqVAxqG7u7TXP
         +j4BJrVELyeqYlSIsy13Ermqp2XIvW4SFb2s/To599XLdNO/Zz38Y+r1ppwwhb/NccGy
         /AlT8tC7Y0L3VVuqWox6vRgco1llLWjmrzYyPQWk4i2lRfCyMlGQv6vVusTqJN40NCbX
         66HXN2D952Z8BHla2EzhJTDBJpTZWXmggOSjo2Pt1EFFyhPygkLfmIVjBua6gQQeCoSB
         K0wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1gVkLjFWXdsLXhZXMgSkslb6Gc2W6vyzdGMqF3LNrLk=;
        fh=wBKLSY1Bdr+igaGrlKWybWG+qeKL4mombDEgAYC5AKA=;
        b=XDNIFOOfoIfxDsA2fzTRDfDbiStKQ4/MK+rk7j2OQx3+kkjiQaLaIo9NpiU7eovqSP
         Hw8hzhqybq7epl0Oy26gD0fFHvndRVTzd7jv77nRveNdh0BWDH1vl3s3L7ywPwqt7mhI
         VYj7FvYC42F+Rr+2Pt/QJtaJtLWIfolc2zdq3Mbmf4RagR0GEf1kVMZIVGHZ+oBCie/s
         2HaFM3pi+oEeE5ER4yWi9INr4fHp+8Mu+FCafyKvmmEX0zuoi8NQjYqkhtBnVhucTFfk
         yCHK+Z+bpUrSEBNgnibRBwFwJ5vj4WefKrzwQ0nWUTj3/po5de2wTy88GMn+S/tLwTIv
         nhZQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768555517; x=1769160317; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gVkLjFWXdsLXhZXMgSkslb6Gc2W6vyzdGMqF3LNrLk=;
        b=WPdd/WQ57EL/QpICqnmwuhl4vf9SC1aCrJ7KWfigjLw383OU1LzpNunRCjGhbCYamc
         I4yELT0C/7vSwHtaL0tPRTTIlyA3KfGI22esghG1kDzM6yOII5Rq2sIz/LUpjsKFrH6j
         lJZ0WX+iaX7a+RCNNRoftQKyBv6pfZ6NPvtuRPyS2OXrIYngNLJ3yIP9DD30DTWgt6uo
         Kv1NOL87rUAX944+GzFYKTsO4XEGW+1n/DRaDQIj7lvZrOrkgLAO/HJ+Nrucw+2+2tli
         MaiXhtpSFE33FCjODkErXpUmocO/XYvw7Gu4+NY74i1bm/hPOQ6ZPmnPXqAiG+BF7dEF
         ss6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768555517; x=1769160317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1gVkLjFWXdsLXhZXMgSkslb6Gc2W6vyzdGMqF3LNrLk=;
        b=XGlUDWK3u9BNbbB3OUQcEzxcy00371Lhmrr/y9YKmYjJL+yx4uOu9598oxN17OBTfJ
         rKSA2qQKEYS4HjwOU3xuDCoAhePzpUDJd0Hj7OLMpEu+8WXIT73qDIj35t4nLGG2Bos+
         zieQoEMp0mW1IyY6zqCwuSdgBo7LBhyHqO16mOP2VeiQmh7so/RgOnLyuqqesJt6LsQK
         LaHBFzHoNCaNPlRDYshRcp2xsLdqQGw4cWoQLj6/LUUYSKOwOF+AKRcsuyHEpUrQWqwd
         +YwrpVMphKq1N2y93JxZu+dajAr8pIbxl1iH9mdhnzN426RATSsW7+y5d/gp3Y13Xdyw
         4D4w==
X-Forwarded-Encrypted: i=1; AJvYcCXA2yJovGHI18Ja5kquYvaLW/wlTX3U2+Tw5yDZLmZiIbsZbDvR2gh/Pzq4AkDrji4r06I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1+U6/uKiAUgpq+HBEa3QjmsUEGjie5gLbi7OAVF84a4w+9zSa
	VRyEHVgkk70m6yAlU8yZris5GYQLZU2ahVY7JNR+CP0SLMVn8RxiJA3M+/u4TCtehhy30gRogIx
	+yB260wL1SX1ZRW1X8doRxR9CTz67bWc=
X-Gm-Gg: AY/fxX6AjYaSvhHepnSBKWJyXV/Uu38odaml0g1AVJAxq3lYsRXS+DiF7hqPconIXfK
	LxF2IioBGXsF9HSmBcnBiXojxgr3G4N1RwLkB4HBq6Pikkl1QkScPa6avvzkMMmVpRGSA55+Kh/
	fE03AAMPDluqnqkmkeqV4xYUY6iELv91G07Fs/vyYhvgkblpVqdXdIlyh9LfxekCBisTmkUYvJ7
	pIVm8585SnqZ4ZFuySSDwpKvVthOf+pkI8oBTXIIG8YrkSg9RGFf0faLZoSVVjl66wEXy/1w2nV
	e4qRce0lc8QTrvh5lqDAww35IDtm5oY2k3wx2kBBPD19jzk4AtN6pDDW2Ch6a3ipAqbmRrAr1DH
	1usurI15gM1Q6GxDvLPJ0
X-Received: by 2002:a05:7022:128e:b0:11f:3483:bbb2 with SMTP id
 a92af1059eb24-1244a72e2c6mr2287226c88.12.1768555516713; Fri, 16 Jan 2026
 01:25:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260116091704.3399142-1-Qing-wu.Li@leica-geosystems.com.cn> <20260116091704.3399142-3-Qing-wu.Li@leica-geosystems.com.cn>
In-Reply-To: <20260116091704.3399142-3-Qing-wu.Li@leica-geosystems.com.cn>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 16 Jan 2026 11:27:58 +0200
X-Gm-Features: AZwV_Qhvgz-kbrRItIaZk0_yMWKQZjkC3dhXXrMaQSnI1xaVYEnm76i5Ds3FryY
Message-ID: <CAEnQRZAz_-S29L66a_ySxGAX-SKAeAvHfKqjanLsGNCZ7_zsAw@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] i2c: imx: add abort path for invalid block length
To: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, andi.shyti@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	bsp-development.geo@leica-geosystems.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 11:19=E2=80=AFAM LI Qingwu
<Qing-wu.Li@leica-geosystems.com.cn> wrote:
>
> When a block read returns an invalid length (0 or >I2C_SMBUS_BLOCK_MAX),
> the current implementation leaves the bus hanging with SDA held low,
> blocking all further I2C communication on the bus.
>
> Add a dedicated IMX_I2C_STATE_READ_BLOCK_DATA_ABORT state and ISR
> handler to properly terminate the transfer when an invalid block length
> is detected:
>   - Set TXAK and receive the next byte with NACK
>   - On the following interrupt, generate a Stop condition
>   - Read and discard the final byte
>   - Report -EPROTO to the caller
>
> This ensures the bus is released correctly and allows other devices on
> the bus to continue operating normally.
>
> Tested on i.MX 8M Plus with continuous block read operations.
>
> Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
> ---
>  drivers/i2c/busses/i2c-imx.c | 55 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 53 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 85f554044cf1..71457dbffb7a 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -233,6 +233,7 @@ enum imx_i2c_state {
>         IMX_I2C_STATE_READ_CONTINUE,
>         IMX_I2C_STATE_READ_BLOCK_DATA,
>         IMX_I2C_STATE_READ_BLOCK_DATA_LEN,
> +       IMX_I2C_STATE_READ_BLOCK_DATA_ABORT

Please add the comma at the end of the last line so that we still have
nice diffs
next time we add an element at the end of the enum.

Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E17285C98
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 14:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771856088; cv=none; b=DsPp/MiKFR0+JOB1Ydxufa8Rxw4HbbFZBoSxgLuJzV0GEW3UJjT+3sYzguLw8yGOxVjEIu1ulNWhQFyo+v4rXskwQkH9fSk7RKMtzjiO0y0UB4ZAWxfzFNdoYgRtjPsKMQi4T2hFnDqePRxTcl9jfzp06x+Z+F6Vvml/kpisj7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771856088; c=relaxed/simple;
	bh=BPlCyTz8G/El4l0BA0OckJ22InPEejXQZx1TWREEqyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u5gdDlgvdzHp66lWZzUwkuk0VjVByO/HXuF0A/yINS8zxpbulYwGGQ+EUacMpYkp8oBgddohHizyJcHUAbSzQvbR1wrfkw8N4OYR7S6Y1MgSxzndyc1ahyZTCyfdpaC9PIAsNn92LMWzG1eCvRIr3og0J4Jd3VBBJpm10zQR6vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7d18f80b5c2so3730922a34.3
        for <imx@lists.linux.dev>; Mon, 23 Feb 2026 06:14:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771856086; x=1772460886;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLzVdK8lDfgaTPyV9xNjlD/1kxno0u/2SblofGNbVRQ=;
        b=CjHY6J5iE2vd9foldp0Tey1ZbKwKrwrR43lYSJ7BhHlSs8d2rdtjTGuIUopkCOFXFI
         KZG05N59HHlqg+ovaAQrwAoYWdchAl26Qm6Ij8qcvi8tICyfULWvTXKPXPnPipEQd7yk
         FJUgNOWNAwPjAKmi0Sh/sUUrF4WNdtHZ9wxwaBhh8JXh5MQqD6rQObfUf9T9Rc9zdBIA
         vurjFIEN1R9LrlWfC2+7XNJIT0QSGtRaYyZeYbJy7SnjCdP32qCSD17L/oUIRHn/QdIW
         XwwjS7qs63koQQYaaL9sghAg+maOtBpTg7zavcu7s1sMS9YB5rHnaS42Pb342tpMwY9P
         RddQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdbi+6R3JASZcZw+2Sc/37cOUiWc3cM4rE+O94/zNdxqDAApA5vvIkG9isMPBub9wm48k=@lists.linux.dev
X-Gm-Message-State: AOJu0YzuEQiWRNvTOeqtXHjbXtrNt0e7aS9h3oh2nFoN5VcJFqdD6T5I
	zomqrYknz4CGKP46c3ZaKxHBf3MvoE0U42Q5Yw83xERSabyepCwlD91/daN/MhMy
X-Gm-Gg: AZuq6aIi1Q+loB/FY5VwLgJRJFq471Eg0LLvuw/mFdhWSFMmgva3p/nIv/fk9T1ts+L
	dKbzUihDZQvoWS7AX2v5rNqD5QKB/dfzmbif+EJErHooYvjb6wQhL3P22IO5I8EHcX4QJuAmr8h
	dXE02f+54PPiqBHYCvLizGaAe7atrKqN8ik9HrMiC8ht08pSHfB9bFy2XuRJDExbXoLUHblk2Gt
	4OdcX8RKEo1vdkU4V9dYlIw/jmnvcSuLHOeVgg7ZMPzQOPONtwmr/i3dva70ByROx0b5WeeS3pp
	tQFdx35EWwjxpn1MLB2cXW2qE9y452aQ7ERwDZJVB1qnyhF+ObgP5JpMLwwg2mTAaxREedQry9i
	GEzsIHhoERXh0lqU4VfQctrn+4i0zUTDWG/jmCs9odhmLoy8jN7zMx1mytq/ix5DjwJOYzvSJU5
	zQ1UMmwER+fR2AX4if53mnpEKE0L5hOa8zebfeDWDUsB1H0q8jileYnMc5ua2Lsb9Q+lzGjbM=
X-Received: by 2002:a05:6830:2b23:b0:7d4:4d3c:c601 with SMTP id 46e09a7af769-7d52bdf6f79mr5699807a34.5.1771856086548;
        Mon, 23 Feb 2026 06:14:46 -0800 (PST)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com. [209.85.210.53])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d52cf78503sm7357585a34.3.2026.02.23.06.14.46
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 06:14:46 -0800 (PST)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7d4c383f2fcso3781949a34.0
        for <imx@lists.linux.dev>; Mon, 23 Feb 2026 06:14:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVNNCbt/5hncgis7RuXFANjokYp8BN0uudbPVdM90z/MoQZCcKJDPK6MiGEmmTVqzdnUws=@lists.linux.dev
X-Received: by 2002:a05:6102:38ce:b0:5ef:a346:a020 with SMTP id
 ada2fe7eead31-5feb2f081dbmr2742454137.17.1771855750377; Mon, 23 Feb 2026
 06:09:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
In-Reply-To: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Feb 2026 15:08:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWJCc-UeaJLM4dpDN=toDvteXFvOFpTm5AbvNoKf3rTqA@mail.gmail.com>
X-Gm-Features: AaiRm50V2ONm2B9njU7ZJRcOuR4Nb8zI5Hsqj9aPxNU6M55eyuOZ1HhwjvL4ass
Message-ID: <CAMuHMdWJCc-UeaJLM4dpDN=toDvteXFvOFpTm5AbvNoKf3rTqA@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] i2c: configure parent device and OF node through
 the adapter struct
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vignesh R <vigneshr@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Mon, 23 Feb 2026 at 10:06, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Changes in v2:
> - fix a NULL-pointer dereference in gpio-rcar (Geert)
                                      ^^^^
I guess that is bound to happen when a GPIO maintainer touches
the I2C subsystem? ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

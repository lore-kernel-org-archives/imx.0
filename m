Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CDD335C0
	for <imx@lists.linux.dev>; Tue, 20 Aug 2024 01:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724117665; cv=none; b=fpX99q2G8c3zY3eMQXL7h+6e03kD6G84rDknRMPNhavq/+N6UsIMBm6T7XgSNs4vFiPFeJ8lkye+RMK6PldC7ezXXxyI4kuWwxXksWk8J/HdHX+FGm9TFFISs7OfJ/e9byutKHaL0UvZ1ca6xoV60Gj2BZIDXh7CEPn9J1+TtV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724117665; c=relaxed/simple;
	bh=o6qPa8f3sP1mC+rT2qdvoPFSMYzpk0OUGYh5ItWMEms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aVG0YieN3yY6d0ENs4J0MZlA8F33/SYpwEMa0JRwXUEGAriiliOR/n7HBxRLHpVJ5pMMLJq6ztYKCPQwKRynMwzRtU6cLS1DyPwTohju8Buh8rrvo8ihXIf8KkE5kEmX5xWFMvWqWGoHvICr+0Ecp1anY0RWxhkXwthWjMBYLvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=REaoVrzL; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="REaoVrzL"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-39d25267dacso2023665ab.3
        for <imx@lists.linux.dev>; Mon, 19 Aug 2024 18:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724117663; x=1724722463; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zz0yf1/Y0q98UkeCNc6m4P8pN/IvsoVhD8EtrTurEF8=;
        b=REaoVrzLu66UgMJshZFK+9/QMAl7blM0wqOV/2rR13MAtxRSjuw6sfRAznJq1e6Bww
         HObITTRK+s7vCdJHMwjgT3UQnmt3KEsfIjCE4L8EOvvcdWL23yHGpHiwB1wEe4ZApNUj
         LWnmyZUi8hnAiqAPkpQ20o5/lvInxLXKJsC8eaqtDGmj1R14wNHBqQM7RJt5OmtAPco6
         dZmmXLN6M4+IBXUZjnotEfBoC2x+UC1X4SRYHp90fqwR6qfe31g+RFLgHH09FHd/Nn1a
         0z4Z3jV72eZbdvpCmfSCfzr1BJ2Drj1yYVX68LzFLSkF+HvZl9Du3k+ltoON8fi8XT5n
         SsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724117663; x=1724722463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zz0yf1/Y0q98UkeCNc6m4P8pN/IvsoVhD8EtrTurEF8=;
        b=H9RJiVroU4zEtNE8VSApFTlO+lV0IdixF5uhPv/sBVOxXXnXuX/fikpB+xT1hKVmCG
         L6xTwAM5w9XaeeSRbsbDBBwI9ch4DpEt306KyxwGQaNYcC6lEI4uZPk2HoT+qUOIa/zH
         jPt3f6S0gv7WlLdKYETjM6m2Eu4A3uGJ/S6i9JCy8vYumA5vnJOax3a94XlNsxTW9/TU
         hkMuYLyBqsxmHusz1KUkO8haYxaCv7+hZUmafBR/pGTGfyeKr/MR/q9cw3njjl1KBh5A
         R2e6H24EEU+eLbvpEcGD7H2tWFEIzP+pNAP60v5mW/BkrrYrGhs7UjoG9HWSsTwz1AB1
         GOFA==
X-Forwarded-Encrypted: i=1; AJvYcCW28Yz1GxL2ubmiOCjnfo+n624A3D/N2o0VOqadncYKf2PgGJkzG3GYO34loJAzOw1X+2M=@lists.linux.dev
X-Gm-Message-State: AOJu0YwmkHfTD1RLP97yNqTptq58T+g4n61pjIADwZ59m2L6MQX5jEjh
	6uftRbUo4GwLn3Zw9pnqbhWr2Ncn15kB5JhvFTiidYzNoh7W6Fzj/feWEhZx+1KVr5V/w9oCZab
	2ZKvyOXP2ZaqlnpPqBm6PRPTZ9jM=
X-Google-Smtp-Source: AGHT+IH2AsFaMWdba8AOgcnp+2GFW/3VG5Vj4/V/h1JYgxxD5JHekYstIjqy6bOiXsUFWjTCM1F2jVROifOBG4WowQo=
X-Received: by 2002:a05:6e02:1d0e:b0:39a:f126:9d86 with SMTP id
 e9e14a558f8ab-39d27963062mr82986245ab.0.1724117662736; Mon, 19 Aug 2024
 18:34:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240819-i3c_fix-v3-0-7d69f7b0a05e@nxp.com> <20240819-i3c_fix-v3-1-7d69f7b0a05e@nxp.com>
In-Reply-To: <20240819-i3c_fix-v3-1-7d69f7b0a05e@nxp.com>
From: Stanley Chu <stanley.chuys@gmail.com>
Date: Tue, 20 Aug 2024 09:34:11 +0800
Message-ID: <CAPwEoQOXme+GofEhpXaBBmsyGJP-QQtLMJG45PTdNsSqFn391w@mail.gmail.com>
Subject: Re: [PATCH v3 01/11] i3c: master: Remove i3c_dev_disable_ibi_locked(olddev)
 on device hotjoin
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Parshuram Thombare <pthombar@cadence.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boris Brezillon <bbrezillon@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Conor Culhane <conor.culhane@silvaco.com>, linux-i3c@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 12:02=E2=80=AFAM Frank Li <Frank.Li@nxp.com> wrote:
>
> When a new device hotjoins, a new dynamic address is assigned.
> i3c_master_add_i3c_dev_locked() identifies that the device was previously
> attached to the bus and locates the olddev.
>
> i3c_master_add_i3c_dev_locked()
> {
>     ...
>     olddev =3D i3c_master_search_i3c_dev_duplicate(newdev);
>     ...
>     if (olddev) {
>         ...
>         i3c_dev_disable_ibi_locked(olddev);
>         ^^^^^^
>         The olddev should not receive any commands on the i3c bus as it
>         does not exist and has been assigned a new address. This will
>         result in NACK or timeout. So remove it.
>     }
> }
>
> Fixes: 317bacf960a4 ("i3c: master: add enable(disable) hot join in sys en=
try")
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/i3c/master.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 7028f03c2c42e..852b32178b722 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2039,10 +2039,8 @@ int i3c_master_add_i3c_dev_locked(struct i3c_maste=
r_controller *master,
>                         ibireq.max_payload_len =3D olddev->ibi->max_paylo=
ad_len;
>                         ibireq.num_slots =3D olddev->ibi->num_slots;
>
> -                       if (olddev->ibi->enabled) {
> +                       if (olddev->ibi->enabled)
>                                 enable_ibi =3D true;
> -                               i3c_dev_disable_ibi_locked(olddev);
> -                       }
>
>                         i3c_dev_free_ibi_locked(olddev);

i3c_dev_free_ibi_locked will still encounter WARN_ON(dev->ibi->enabled).

Thanks,
Stanley

>                 }
>
> --
> 2.34.1
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

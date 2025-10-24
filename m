Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF81813774D
	for <imx@lists.linux.dev>; Fri, 24 Oct 2025 02:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761272163; cv=none; b=vDbFaJ8uMDpR1y0AhH3W3u9t4BwSpa129+Lk6MZQNGiyjCEFxVeUpcRTMqx5gnDpKqAXjx6o1VFmMrXzQohO0w7AmbuM8KTfCIhvUH7Ucco8u4FelBnDCoeaQlzMrgrWcTgDwY7zhe0XqmcI/SfLX8ZHMQThcFt+ThHO+SNjrMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761272163; c=relaxed/simple;
	bh=715hOslgu7y016qxUdrtVMFM0PPhVFT1NOgcdmQqdD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GTIM3ZDSgcaVN9XgH9kzhrk1CA7UdzLGGQCbxBmiH745sX834aGuzW5tC7qkhzsI+Gqxo+VBZdP8s+7nYnE3pWyoCTpOeinlMpOoMljae4RDrL8Xo1N/2jzsEvX954w3z7PW1OFQmrkqni04HXgCK5tANyIxCnQ2Vzh6cqUnuLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9AzKqRt; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9AzKqRt"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-33082c95fd0so1616147a91.1
        for <imx@lists.linux.dev>; Thu, 23 Oct 2025 19:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761272161; x=1761876961; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BI0Vwi2MFtORL9n5J5tJUkBs2QczZqahhbzv7dm+XZ4=;
        b=d9AzKqRtaAn1xAyHW0Wjc5Q0drV76cGs/U0osWGPu+tyHnf8Ggy96lDfMkOv7cqNNF
         SpciJKeyu8XMUzP6leJxwLbPBhOKyqMA6dKau8ISEX3oFrFDA5y506UUjflUZFSc1lLm
         Oy1yLGFGY75Zx+KU1odQQkHXZ3ua0ZUx6YHNLtj7e+FnH4Bj5kfxxQq+vZEVbcsf2HG1
         kfKhP1/eq/0N3xjDxxvcl3jOaOAiyWTbPBQtmE3aTKccUvhhaCF4M0E7tWG0MoPQJfNA
         r2HbztvNMQC46Rzxg1WKdjVoazxgQXnafRWRnmPEueBvWMq2veLCyl6rq8NP7NH71hOH
         cQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761272161; x=1761876961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BI0Vwi2MFtORL9n5J5tJUkBs2QczZqahhbzv7dm+XZ4=;
        b=VbYik1eA6dkb8Jz6SmuzH/vY6ZMvekoSSMlP/ReyDUM5Xk1RUIzISDgZb2385zlbIo
         J5M4Y+OvKftlzfL+muumCn6sgZ5yYlpAREn71pa7dXqil3I2BfCe7fTreySatGsURUVX
         X+mQviXb7AF4AKygjN+/HJJKkGMeEtUUU7DniqZqQJjl1hDb7F5QcGM3/wJMh6g6nr1u
         SKXvgYdrffErY2oE4QuZD1Nt5VuWdsfeKS0QHnnr/RKxK/vbpCYh0ljZzqvd5AVLIi8F
         RM5TTFwBvRnBAjxKUPJUHDjiCL1IilUCyiXiBi4ZlGrN3ZmU6mhdfzqTdOixHWD7eaX6
         3syA==
X-Forwarded-Encrypted: i=1; AJvYcCVhk20f5Kdk8RFKld0G9FDU9vnTkxsGcIpk31dE/uhdLe6ynDeenDbTGDWQd3oloQOfRLw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+56uHJntbi7h8pl/Roorjsq+UDh30qVSDZIrXBIS5VXyEw6Ev
	441T0z6NQrmaWtTK8/DoLpDo8qsT8wqS+a/do7LS5CBXocKbMwFqB5vSJXBXEpqLaTYLT1m5szh
	C7AxwiTTCYvZNlnsc2+8oWuvvP0tUOZM=
X-Gm-Gg: ASbGncuaoA0P0gWxVMm+ygMvKFHyyRb+r3735yJ1atSNtn5CCb6RVdd2XnFrgBIV1zI
	4IaGi7WLhBcK9by4+nWVdzNyTSCN2f624slPNH0nXgGCOkBXvp82aEqI3t7DjN21rNYKvZ4VWJB
	BntgnOrVVbOxqPAkaUhOjsSBYReX35nEaPpZ+VpSNGCedi98Z85pd14lTV0SIQ6gce/bizTAYq1
	kdwpldTwpSyHBb7GGFNJkFxZwr/h7YYrJbGtwBE5NC5Kz7y1CxC4ppW7hzuksWEwnlOMpU=
X-Google-Smtp-Source: AGHT+IElNfoS47SY7t+lKBFv7+5KrhLxG98q130ySpWKzXc0GkoN0tmuT6t9nFhyiYXpfSO3SfnNJSOMNthXNwS/NDA=
X-Received: by 2002:a17:90b:1b50:b0:33b:d371:1131 with SMTP id
 98e67ed59e1d1-33fd66f565amr743481a91.34.1761272160901; Thu, 23 Oct 2025
 19:16:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251024-auxiliary-v2-1-a353dc9e6b1a@nxp.com>
In-Reply-To: <20251024-auxiliary-v2-1-a353dc9e6b1a@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 24 Oct 2025 10:15:49 +0800
X-Gm-Features: AS18NWDZ9oaK7UwbUVQe-rbcE0CXdttwjA1LC6T8fVyGVAC_wDzugHZZMraTOl0
Message-ID: <CAA+D8AOF+3he6nV6yDRnept2Epo1yTZgJnn+P4H8hkktec5wEw@mail.gmail.com>
Subject: Re: [PATCH v2] clk: imx: imx8mp-audiomix: use devm_auxiliary_device_create()
 to simple code
To: Peng Fan <peng.fan@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 24, 2025 at 9:46=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
>
> Use helper function devm_auxiliary_device_create() to remove some
> boilerplate code.
>
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu wang
> ---
> Changes in v2:
> - Update commit log per Frank
> - Add R-b from Frank and Abel
> - Link to v1: https://lore.kernel.org/r/20251023-auxiliary-v1-1-0a16fa4c3=
cdd@nxp.com
> ---
>  drivers/clk/imx/clk-imx8mp-audiomix.c | 39 ++++-------------------------=
------
>  1 file changed, 4 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-=
imx8mp-audiomix.c
> index 775f62dddb11d8cfd17a4ebf7a677ef399c5e617..131702f2c9ecfd693af47094f=
e61b486ae6e8f6d 100644
> --- a/drivers/clk/imx/clk-imx8mp-audiomix.c
> +++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
> @@ -230,50 +230,19 @@ struct clk_imx8mp_audiomix_priv {
>
>  #if IS_ENABLED(CONFIG_RESET_CONTROLLER)
>
> -static void clk_imx8mp_audiomix_reset_unregister_adev(void *_adev)
> -{
> -       struct auxiliary_device *adev =3D _adev;
> -
> -       auxiliary_device_delete(adev);
> -       auxiliary_device_uninit(adev);
> -}
> -
> -static void clk_imx8mp_audiomix_reset_adev_release(struct device *dev)
> -{
> -       struct auxiliary_device *adev =3D to_auxiliary_dev(dev);
> -
> -       kfree(adev);
> -}
> -
>  static int clk_imx8mp_audiomix_reset_controller_register(struct device *=
dev,
>                                                          struct clk_imx8m=
p_audiomix_priv *priv)
>  {
> -       struct auxiliary_device *adev __free(kfree) =3D NULL;
> -       int ret;
> +       struct auxiliary_device *adev;
>
>         if (!of_property_present(dev->of_node, "#reset-cells"))
>                 return 0;
>
> -       adev =3D kzalloc(sizeof(*adev), GFP_KERNEL);
> +       adev =3D devm_auxiliary_device_create(dev, "reset", NULL);
>         if (!adev)
> -               return -ENOMEM;
> -
> -       adev->name =3D "reset";
> -       adev->dev.parent =3D dev;
> -       adev->dev.release =3D clk_imx8mp_audiomix_reset_adev_release;
> -
> -       ret =3D auxiliary_device_init(adev);
> -       if (ret)
> -               return ret;
> +               return -ENODEV;
>
> -       ret =3D auxiliary_device_add(adev);
> -       if (ret) {
> -               auxiliary_device_uninit(adev);
> -               return ret;
> -       }
> -
> -       return devm_add_action_or_reset(dev, clk_imx8mp_audiomix_reset_un=
register_adev,
> -                                       no_free_ptr(adev));
> +       return 0;
>  }
>
>  #else /* !CONFIG_RESET_CONTROLLER */
>
> ---
> base-commit: aaa9c3550b60d6259d6ea8b1175ade8d1242444e
> change-id: 20251023-auxiliary-3998bced9cb9
>
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
>
>

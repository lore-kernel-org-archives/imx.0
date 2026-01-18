Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610D3500976
	for <imx@lists.linux.dev>; Sun, 18 Jan 2026 20:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768769695; cv=none; b=oRe7ob6X3XdMw0H0NANZjSsGyT9HHTGBZ/3eg0AaSL9xJvSFWHcQK8wm2SWvHi9eSjg/d1Gk3s/D5x+AfTC3U816u0DXzfMlxI3vi8fMnMn+wPzYHjVXG23F6Z6j0lozxlrR7V/T5TM9z0jJo+dZvAJfCibh8V/h8uS9goB+UPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768769695; c=relaxed/simple;
	bh=gCmkNaOz+ROXaG/GDMvLkt3S3eqw31C4DPq+R0e9ZB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TUckkjqDvK/euEfZoEUUiIJ+8FZuc15oK0GMNN7AJLLVS6Kmr5YBXdDRqXrRE/Q//oyxYEFTQ9Eb2T83jshMOJrtGlsM4kLdTqdnrTR+FvwabgQqpy62sP7Hcv+FosebmvIpY+f8TSgS9myOx+w9fwobw4pzb5Pjnd/tJy7bs/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lk2WfkSO; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lk2WfkSO"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-45c9fdf2a06so1498242b6e.2
        for <imx@lists.linux.dev>; Sun, 18 Jan 2026 12:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768769693; x=1769374493; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SGN46lGiiSn5Nw49WHCV3A8HEoxH39zs+bPdgj/zyCo=;
        b=Lk2WfkSOiElPG4A70Ds2ESTDns4qlA8FLzITO9z0xJV95R3gjdaVjzVV9eRlPbHd8Q
         QB1DFHUsvnhGptKi9FeSOzvbAmhHvtZyeYpVxyEA8AQo38QVxb8fCdtNask3O361K3oH
         BazBFYW237S5fVp5kQWsG3qnNJ5osdo/1wFVDTtvs8Vh8+IB+9Udg3UgiPuMBGha0YQB
         xEtbWosCNpZtMe54VbRX5thHT0Ui36R1qLCLZk4vw4HNz1gV0DO85z2trvvBYBbuVwKp
         FywhwG7izEJARrGo60mZvi75fu20d0+kzHyApLamDBOPji/wVcBfPhara4i+UhvT12iv
         bSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768769693; x=1769374493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SGN46lGiiSn5Nw49WHCV3A8HEoxH39zs+bPdgj/zyCo=;
        b=iHaZRjzPawIPFdAO85tXblWKJPYFYaDAAvsIgni6PylcP2T+Li4JgzksF58DvMHOz5
         nJbKuWS1HPiVAKTycM3BeCJKOFalkid2mVEXfYAgD0N2cjxlB1UTPTPJU6WVC76jJJY7
         hNJsURO+b24MocSMwBv98X0GyKrHydS7DzCqBwGoGxF6iwdktcD2Y8X1f3oGFoX5tYDh
         RHghpuB461YfDfoNayUIeXMFXCdNygY0nHb48n8Ebfsq26xGKklRL//u3JqFOroKCp7g
         xTlk7PVc08EkeJkYy5/Glg1+1vuA9lU+p9u5s9WoeJ5lMchex1dDGZKwD77duEOAjdKt
         3ycQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2KUk/xkQUSmGm4WW2jwnlrEcXrvgxKkiIvr+jqV42sgL0M+fAF+TtG4qiQQA45ScAGZE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwWdFMe51ULe6mUzv2OikKm1vSkYBF9gPie9eTx0DWUL+h+H5vR
	SdnzAoCeyUgFXeroC4NPlWSNXPJrmGmg7gEOoj7M5ucwDWyBRE2736HI881GNNs1YwldWVyhPFf
	eeAxQArO7kZGeu0xFK46H4Hz3QrXiUdw=
X-Gm-Gg: AY/fxX53UCZoeCVQcRhbtPggtc6eWm5tLpK4S9FesUI+YrpnAfnJ9R2+z/bhMv7ynkI
	l71LEwXE5i3H/PcyslXewuJ83PmQxxV9dAWr/xuarJhG6c9xga3lG7/kXT/uDyGBMzTUsX8BFOx
	gTlg1lc8LSJ2lo09r9BVSXSvRnXya5VGBcv0AYOROoXMm4IRStLDf3SGhxYr4bnD2RBMxZHerHL
	pAaIIOfCbCN67mDZ9yuqJ3bX4Wr9bEiNDy+nimcih7bIhfM4hrQQ7ExAcu6VzczysTnERuLLATr
	SbMZRO8=
X-Received: by 2002:a05:6808:f91:b0:45c:7b2c:10ca with SMTP id
 5614622812f47-45c9beb8758mr4712801b6e.13.1768769688407; Sun, 18 Jan 2026
 12:54:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251216-imx7ulp_mailbox-v1-1-66b5bbcd3005@nxp.com>
In-Reply-To: <20251216-imx7ulp_mailbox-v1-1-66b5bbcd3005@nxp.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 18 Jan 2026 14:54:37 -0600
X-Gm-Features: AZwV_QhIxbEz92mLErTU5GwUSqKCCNXMoI5nHSsvKDXWYHWqLAJqWsOFKMlpZco
Message-ID: <CABb+yY3SAUiw=_Pa7RQqfaP7LsX5cS2OprEAq9HRY1inebjCaA@mail.gmail.com>
Subject: Re: [PATCH] mailbox: imx: Skip the suspend flag for i.MX7ULP
To: Jacky Bai <ping.bai@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, peng.fan@nxp.com, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 1:59=E2=80=AFAM Jacky Bai <ping.bai@nxp.com> wrote:
>
> In current imx-mailbox driver, the MU IRQ is configured with
> 'IRQF_NO_SUSPEND' flag set. So during linux suspend/resume flow,
> the MU IRQ is always enabled. With commit 892cb524ae8a ("mailbox: imx:
> fix wakeup failure from freeze mode"), if the MU IRQ is triggered after
> the priv->suspended flag has been set, the system suspend will be
> aborted.
>
> On i.MX7ULP platform, certain drivers that depend on rpmsg may need
> to send rpmsg request and receive an acknowledgment from the remote
> core during the late_suspend stage. Early suspend abort is not
> expected, and the i.MX7ULP already has additional hardware and
> software to make sure the system can be wakeup from freeze mode
> correctly when MU IRQ is trigger.
>
> Skip the 'suspend' flag handling logic on i.MX7ULP to avoid the
> early abort when doing suspend.
>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>  drivers/mailbox/imx-mailbox.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.=
c
> index 6778afc64a048c70a3afbdf44783ede0d1626937..003f9236c35e0943441b5e3cb=
01569451d7d0a96 100644
> --- a/drivers/mailbox/imx-mailbox.c
> +++ b/drivers/mailbox/imx-mailbox.c
> @@ -122,6 +122,7 @@ struct imx_mu_dcfg {
>         u32     xRR;            /* Receive Register0 */
>         u32     xSR[IMX_MU_xSR_MAX];    /* Status Registers */
>         u32     xCR[IMX_MU_xCR_MAX];    /* Control Registers */
> +       bool    skip_suspend_flag;
>  };
>
>  #define IMX_MU_xSR_GIPn(type, x) (type & IMX_MU_V2 ? BIT(x) : BIT(28 + (=
3 - (x))))
> @@ -988,6 +989,7 @@ static const struct imx_mu_dcfg imx_mu_cfg_imx7ulp =
=3D {
>         .xRR    =3D 0x40,
>         .xSR    =3D {0x60, 0x60, 0x60, 0x60},
>         .xCR    =3D {0x64, 0x64, 0x64, 0x64, 0x64},
> +       .skip_suspend_flag =3D true,
>  };
>
>  static const struct imx_mu_dcfg imx_mu_cfg_imx8ulp =3D {
> @@ -1071,7 +1073,8 @@ static int __maybe_unused imx_mu_suspend_noirq(stru=
ct device *dev)
>                         priv->xcr[i] =3D imx_mu_read(priv, priv->dcfg->xC=
R[i]);
>         }
>
> -       priv->suspend =3D true;
> +       if (!priv->dcfg->skip_suspend_flag)
> +               priv->suspend =3D true;
>
>         return 0;
>  }
> @@ -1094,7 +1097,8 @@ static int __maybe_unused imx_mu_resume_noirq(struc=
t device *dev)
>                         imx_mu_write(priv, priv->xcr[i], priv->dcfg->xCR[=
i]);
>         }
>
> -       priv->suspend =3D false;
> +       if (!priv->dcfg->skip_suspend_flag)
> +               priv->suspend =3D false;
>
>         return 0;
>  }
>
> ---
> base-commit: 563c8dd425b59e44470e28519107b1efc99f4c7b
> change-id: 20251216-imx7ulp_mailbox-9dd35bb9b94d
>
> Best regards,
> --
> Jacky Bai <ping.bai@nxp.com>
>
Applied to mailbox/for-next.
Thanks.

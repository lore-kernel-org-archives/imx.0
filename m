Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2BC35CB76
	for <imx@lists.linux.dev>; Tue, 27 Jan 2026 15:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769528852; cv=pass; b=WUAP/vbk0vGfM0gjYZWKGbXIO3s5IPPxNHw+z9tg2ZUrut0wHmz9gaiTu5Yq75SIT5vI/4udRPq7+reXJ8JqTUN+Ro8oIoUneKz1RbUFjx83hk01MPqVWDKR3J0yaYtMmY9NA8LKsIRNcBJh/bQTOnsZDsKL6An/gZalMro05Aw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769528852; c=relaxed/simple;
	bh=HCLPCR2cutuEe8a9e/T0nSzNtiAitdZEV3TVlV7ptNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ln1xJU3AG+GS5OvbtNYs09ExZ+9jdX6WsG2H/XVSPCkZBHTHbisjfUCDn/lOQNxBHBpe3D/rlARMStvM5Qhi+JgRQgzRyWCLLWsbicuu+6iudmVAmSVEolzRPigl8Dr7Ejxqbl5HX8uzFqSWsM+OpjDN6/nYlmtYiCUUfqR3GQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gG5Nwj1g; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gG5Nwj1g"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b8837152db5so872280266b.0
        for <imx@lists.linux.dev>; Tue, 27 Jan 2026 07:47:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769528849; cv=none;
        d=google.com; s=arc-20240605;
        b=K7CSV2NnsE3Mnc6gGWmZ2h7Q3jO1f7MFkDANiNr0XgM6BMUiqr9F0q0XafO9UiqRu0
         rWDhRpyJ3bz3vkmyIVkKZYWPpIwdmhfVzwXvYqq81ROh7f8GOucjGUAV+aDqvqRZoUvh
         OVda0oZoEIWz11WjRJayseb52sBy7Y5srPfS4eRtmAYZMAV8u3XnxTi1pY/H9DFeI5K1
         W/v+cJEfyEjj2e9/iJ0LIm4URkyMCD3/Jws2JhQjdnUd6yVuJrz+S8axCjm5jUsYaTMV
         slJ5XEPAv/AmeUjwcX6P3JNKmb/oC+BLvENG5MRd4/mmkpF5TJsVAVQrgIMqf9WIeF0L
         l1MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7eOuyosWnsXIdwMTE3mmiW0j22cD4OeLu7JqhilojCE=;
        fh=5lrX5pksWfyWyr8ubZ1ViKxdc1ELWwWKvQb/qk4lV1Y=;
        b=MT+HtUib7BK339b1t7otT7P2QdDMIkapku9kL3sB69TjO7LZiJO8zhWjwkTrDdgdph
         R0x4nk1YnsQBxgvQr7ZB/s/5fzWfGQGnGFPfO5VoZpg/zDzxRt8wlZGf3vTJSxMmVIxe
         3dABOe8jgP+T/kn6Y3OHGppHf1bYeL40xkNjnJiPrZuqvCUbf8P8KNtBreDNa00nPqNu
         DQwvkmMbMsShK9I72rPcnINgSGnR953IMxt4q7Dw6w1/xDwPfUmImfwm1i4po1SC2hGX
         vnATqo6xVTfEFRart3dMHauqXMMJ1kuCzBJqVmidav3dKuNeMHxQ1R4dRhDPPNRkmD+9
         BVQQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769528849; x=1770133649; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7eOuyosWnsXIdwMTE3mmiW0j22cD4OeLu7JqhilojCE=;
        b=gG5Nwj1gy4+Op249c4POlayG0zYUGz0TgWPsAZ5MKkvB4FOkR4NFTQmh2LSkopZ8eW
         Ai92xjsqO/ZpCXmcqw4taMskvora+XWWKU3ZQMFaHpoc9DJhVxtGmOFbKbCLzrVxgn/s
         fttbQSG1Hg8dgQwxqpbaYttm82Y3/8tkc6sxwP9VGBxGAgUprH9ZFjph/wUUQPTzyW6+
         naXBjIMYIrgL9If0fRVlTtgZM2hkgnjWh9gmLCoNHzhhl1gOjdCR0G4vbZ139UcZP4by
         wPz7MfBLxmn7g0RPm13LmOICEiikDsgbuol0cVnebINgoMK4v0yMI+YFYcLizX8+V8bb
         9BaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769528849; x=1770133649;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7eOuyosWnsXIdwMTE3mmiW0j22cD4OeLu7JqhilojCE=;
        b=XdUuG6KOVVs2yOv53YzCyXFJzEQr02TqOwpVR3COjLjw/eTRcekpRb+n9+A6Z+dn1s
         auLivQgi/xHVBLNsclCNbJ8TFGASxyIsplE6cRBADKEWqHuMNcBirN1hYvBlNxW0hoqa
         uTjBuSPoFZrA5zXitErrrFg+WHzcSMAx2KyfekPd50aDjEVqD1fWCHTIkD1WVmSF4FsB
         8INLyIrZ2tpX8HbpCUCAM/nMKDFZrvyYDFDz+TvZPjLOG2l6LhW7d9ONJ++dhAcH+tx7
         4qjRvDOwytidmTmkxVE46NJvaJlCod8CowN1C6iIXcl5srQDaA/ev4qGN6fXGpGBBzjn
         y7xA==
X-Forwarded-Encrypted: i=1; AJvYcCWqGYXGN8sMPElgpRLcMserrfVVWx3PkTJy7N7RJTKiKm4xqcnCA92Mh/Cm6KZAfG2CTCs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzlkQFWoXuJL/XUwARe7Uq2F64Clrie0l/RAU171sfi3GQ7eFaj
	pnH6Tq9P8inUMAsSrVdnJdTkCsCCmlF8eYrcLJSCDQPkly/QEseP5HQtpDDqcTOr8zWqxSil2bC
	pBZvEvajEM712CmAgxWN2rNTQfaiwW5x2Q7h79XwL7g==
X-Gm-Gg: AZuq6aIUzYvlWnZ8cDLzGyvub8yfRWavnmfbxtb84WjSpjzCkFESGGpdt8LTgHCidRB
	AGEJFxpL0Q43rEdHmWMq8oLDwEMPvRDktytfkcT7d/irpHZvpbtUMD0H0y1/vvWcdhggVmUpsQU
	K76LnIvtz11+/zn5rBuCT2iez9oTMZ/6Bbmk6xHonpzbCZytzCsxDioa/os2SfLQ7jSASipWlf7
	VNnKF4MTfV5wEvZPmsh670SNx2rMwxrNk+ZB1WF113jO76ypAfGVbgLQ0sviEAx8E4QdiQsSRck
	q9MYDUz+Sog2s1lAnbvInXvf/FkyyA==
X-Received: by 2002:a17:907:1b24:b0:b87:2cf8:f7b2 with SMTP id
 a640c23a62f3a-b8dab3e10c3mr158375566b.56.1769528848592; Tue, 27 Jan 2026
 07:47:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260127-imx-rproc-fix-v2-1-7288fcf74385@nxp.com>
In-Reply-To: <20260127-imx-rproc-fix-v2-1-7288fcf74385@nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 27 Jan 2026 08:47:17 -0700
X-Gm-Features: AZwV_QjqQbFcKArui8POG1LTyVyFyhUaVHLmRHbU-P_6uXh9D3Ex2V3D86esp5E
Message-ID: <CANLsYkznMVh240wMUZGayJHRzsUV-NNTiU+ezpLt3rjcwSn5Wg@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: imx_rproc: Not report loaded resource
 table when none
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <frank.li@nxp.com>, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Jan 2026 at 23:51, Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> priv->rsc_table is not NULL if the DT has a "rsc-table" entry, indicating
> that _if_ there is a resource table in memory, that's where it should be.
> Function imx_rproc_elf_find_loaded_rsc_table() is buggy so the narrative
> about a previously running FW with a valid resource table can be dropped.
>

(sigh)

You apparently did not understand my last comment.

> In this case rproc->table_ptr is NULL because the current firmware does
> not contain a resource table, but the remoteproc core still interprets the
> non-NULL return value as a loaded resource table and attempts to memcpy()
> from rproc->cached_table, leading to a NULL pointer dereference and kernel
> panic.
>
> Fix this by returning NULL from imx_rproc_elf_find_loaded_rsc_table() when
> there is no cached resource table for the current firmware. This ensures
> that a loaded resource table is only reported when a valid table_ptr
> exists, which matches the remoteproc core expectations.
>
> This issue can be reproduced by:
>   1) start a firmware with a resource table
>   2) stop the remote processor
>   3) start a firmware without a resource table
>

Another sign you did not understand my last comment.

I had hopes of merging this patch but the changelog is too garbled to
be salvageable.  I suggest you ask Daniel or Iuliana for help.

> With this change, starting a firmware without a resource table no longer
> causes kernel dump.
>
> Fixes: e954a1bd1610 ("remoteproc: imx_rproc: Use imx specific hook for find_loaded_rsc_table")
> Cc: stable@vger.kernel.org
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v2:
> - Per Mathieu, Check rproc->table_ptr, update commit log
> - Include R-b from Frank
> - Link to v1: https://lore.kernel.org/r/20260122-imx-rproc-fix-v1-1-36cc64369a40@nxp.com
> ---
>  drivers/remoteproc/imx_rproc.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 375de79168a1c8d11b87ac1bd63774a3feac106d..f5f916d6790519360f446f063e09d018c5654953 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -729,6 +729,10 @@ imx_rproc_elf_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *
>  {
>         struct imx_rproc *priv = rproc->priv;
>
> +       /* No resource table in the firmware */
> +       if (!rproc->table_ptr)
> +               return NULL;
> +
>         if (priv->rsc_table)
>                 return (struct resource_table *)priv->rsc_table;
>
>
> ---
> base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
> change-id: 20260122-imx-rproc-fix-e206f8e6e477
>
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
>

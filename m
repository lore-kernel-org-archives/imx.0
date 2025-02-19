Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D11E1CCB4B
	for <imx@lists.linux.dev>; Wed, 19 Feb 2025 22:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740003768; cv=none; b=UMK8dZ2jcqNv7Vkf1kb+/IIFY1gm5tuzsCCjOGWAcVnknhD6R5FioxfMPX/Aj3SxhiAiM/lbRhQ6gMe5YTQR6WX2zKpkiaEOc8Fius3Wv9u4s+Z50+xZhzHVCutmhmjjv+wS1pcmAx2MF87IY4xHdrYiiYUFDXBLXMRNHY9vO54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740003768; c=relaxed/simple;
	bh=SHiBAOh0/DlDL8hUB3T6+LtKrV85BGIXTOwOLa6mnT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZFVBiAs76nfQR99DKIll8HKovz7xyj+RsG+fUyJ0miXZzWr2bMu4ZD6yTM5rQZkLYurTqVTV0QCU6HMUsP3y+y4ox7SAgit3e4SVA+WeOTSmSrWOWvzaRGfSgBERyRNprmADb+M/LNZK0nYLxULjC7/AjvLWiKyGpEfyy9Jjrgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QC66WUwt; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QC66WUwt"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5dee1626093so2655478a12.1
        for <imx@lists.linux.dev>; Wed, 19 Feb 2025 14:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740003765; x=1740608565; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y0Ut+HC9eKHgdin8LIIS2Fjeny6qwex+kr1lgIMYN8w=;
        b=QC66WUwtE9jjhPJxCyb68eFnvTPboqC7lf5omrQH06ZmTi8T1DdrH0WDGUpvNqGCxr
         mj5cxC66wlRamMj7PjzGorbbienxpO9/tbG4R94IEZQJ4WiBtz6MT/Z8LXl69GpMq3jk
         ra0K5QZSOHZDdtWjYv2ofIjdMaQm/2P3nRX6ctyQc/gkRdtVt8zXqmJXoHGQ49DjgonN
         57W/ghVLGpdvjT6Daogu+3dQWyR/8IJ+ntpXzCxH1rl/zrxj6PcBlYht7UqCtNv7ofg1
         WoMhikAD4PJNUzqlEWXfu4LiIW37p428G9hDG5+xmPNEumy53dNwze5lqleLz4nLKmrX
         KrmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740003765; x=1740608565;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0Ut+HC9eKHgdin8LIIS2Fjeny6qwex+kr1lgIMYN8w=;
        b=VP5T+FvUYdpWI4p+cOX8SxolVck6a2MY7OJLx2Fwzr++Rs9Ls6NMD2VH30n1xOyJRE
         sWic+qauAq+0uDth8WNqjn/6OcJ5j0OqUjtTtCQQfDjNuuMYXbdaeWrY187g4tF4DK2b
         wWjCPi91ngpZMp4HhXYa1Z7bffRO8QrnTeVJXLSzijG9emYTNW/q7Ku48ooJT5Lw2l6K
         y07w/rYXXTrke8+I+WLYjbK4dF2PbLd+TITQ5oNH5eLu2iUmbk0z2wtAQWy6za3lWBvy
         3JNnr4nPiSpefVNC6fPfI8Wxm1N3a5njPI7B1Bvz99WDGeNA5do4hktdAhMratyT0Q9w
         AtVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWl8I35jvDOtK7oD87bfPxSCvts5DJBtVQCUiJy3mwV/ec0GZel/B6eERG7C+WFeZIOEjE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwaAerJsiNXt+42+2XzA/g5C7rHl4N+pOmpm0bJ15VtB7qunIyt
	vIol5gJSiQ0nWYL3bZ/z9JNaPS8Vr+HMXpLQq3QBEFZZVO8tUB8JK2JFd7crANw=
X-Gm-Gg: ASbGnctSjYJFCfXGFNHGJCC37U6Bb1m7dQQPpKSdMHx2+/qJu2h6vF/EuH+dXpz52ov
	+dvVXKopcZEuulRFVRFyJL7fx71eXsMEJkHwSblSiFq1f3NQiCOui+d7h6npw4pZIQNV/UKxFqz
	I5Nm/RkHh9E/RLZh9Uj9fhC4l+i9xLNp6GT3RzCBce3iaZPo5vsWyhFEX9zaNPQccGbUqav7Emd
	OdON7hOv9oAQoplsBENY9PFwBj3WB+RppMw0mirmsyX207X/ry0/9pBFELXa6NwLDLJ1kRm8UyH
	/8k/mWv5RaFBZi9bVGOWXBY73nOzf9M3F1ihdAh8EtzN
X-Google-Smtp-Source: AGHT+IHgZ/9o+/TaQRZkw3ZCR/vfHz3eRXJzfUy3azBJWNM0TELKM477HK5xLn7uBryQfbFCimYo+g==
X-Received: by 2002:a17:907:890a:b0:ab9:76d7:574c with SMTP id a640c23a62f3a-abbeda27f98mr82689866b.1.1740003764658;
        Wed, 19 Feb 2025 14:22:44 -0800 (PST)
Received: from [192.168.1.130] ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbdf076360sm165470566b.110.2025.02.19.14.22.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 14:22:44 -0800 (PST)
Message-ID: <c52e6c5c-f49e-4727-b669-086ae7cb0e1e@gmail.com>
Date: Thu, 20 Feb 2025 00:22:41 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] imx_dsp_rproc: Use reset controller API to control
 the DSP
Content-Language: en-US
To: Daniel Baluta <daniel.baluta@nxp.com>, p.zabel@pengutronix.de,
 robh@kernel.org, shawnguo@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, mathieu.poirier@linaro.org,
 shengjiu.wang@nxp.com, Frank.Li@nxp.com, peng.fan@nxp.com,
 laurentiu.mihalcea@nxp.com, iuliana.prodan@nxp.com
References: <20250219192102.423850-1-daniel.baluta@nxp.com>
 <20250219192102.423850-9-daniel.baluta@nxp.com>
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20250219192102.423850-9-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/19/2025 9:21 PM, Daniel Baluta wrote:
> Use the reset controller API to control the DSP on i.MX8MP. This way
> we can have a better control of the resources and avoid using a syscon
> to access the audiomix bits.
>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 25 +++++++++++++++++--------
>  drivers/remoteproc/imx_rproc.h     |  2 ++
>  2 files changed, 19 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index ea5024919c2f..631563e4f86d 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -19,6 +19,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
> +#include <linux/reset.h>
>  #include <linux/slab.h>
>  
>  #include "imx_rproc.h"
> @@ -111,6 +112,7 @@ enum imx_dsp_rp_mbox_messages {
>   */
>  struct imx_dsp_rproc {
>  	struct regmap				*regmap;
> +	struct reset_control			*reset;

Maybe rename this to "stall"? There's also the DAP stuff that's actually used
to reset the core so this might be a bit confusing?

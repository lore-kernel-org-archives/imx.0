Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8862AEE7
	for <imx@lists.linux.dev>; Tue, 27 Aug 2024 14:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724769146; cv=none; b=R0O1MR8k/M+RR/gWoJgYCBGcSPrV8uf+i0ttLJr+wXpxTdur6VxB1ue8LrkdSs0bvJHvBsp+WZ9gCRXdiUoDezMoIfl5KXJB+J/rz6eOnBzXOp0L/v2nI4GQgw8zf5PGUfJlxCJs/kfpBFTm+EOddZN5YyBnhAHGFHpRL+eFYX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724769146; c=relaxed/simple;
	bh=QHQAsujoDKj/irae4e+S+yLEKA8zD+A/PR62mesntug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X68vLfNMqg3N18JdAJbn+kGqwwWXSfa8OGDULuf8wnQGiyN18R9W4iLSfg4FnzRwY1ru4NUxziXoERXqWhDrvQxvg9XT2LKJaE/VqQ/S7SIiBbI2J11mj8TN7RZWlf/W78Errf/O8Rb56an/8Zlpd/EDR1uawqhUkbeMHFW46uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mzC/eV2a; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mzC/eV2a"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f3f163e379so86963891fa.3
        for <imx@lists.linux.dev>; Tue, 27 Aug 2024 07:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724769143; x=1725373943; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tk1nXOFSQsJPXJuHSlmHeWGCF+cAqyNmHrEa41Un+J0=;
        b=mzC/eV2aecD0v2Z/X6CiKnSbmu7EgDqNu3TJcPjEcOBkTUzeZvkL0neW3/+Xts3MwV
         nNZj2FSb+u32hISBmJ4XIYcxCD6ixjhpFc3WKLZYNmNcD4zK72ndvT6hEnWVoYrZKeVl
         TZdbPLONgrMoKyfeRQjUxgrzceoop1za7yQXR8QvuoOEIt+kD8rzjDcwh85Rjx/vbwJq
         3ULvzeQoYSKC4EZ732pLwvpM8PPp0LecdCKRQXZzbaWmsLpjJwumIM5Vt2rvZcKbtaFl
         WAnnAxaSQvSKcMv0RRCUwuCBot/7/2SiDfBi6DoBqsZNYc69284eLizD4WMF02bbm5I8
         bFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724769143; x=1725373943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tk1nXOFSQsJPXJuHSlmHeWGCF+cAqyNmHrEa41Un+J0=;
        b=o4SC+M/t18Jt7iFF+TtO7JR6SBcVptwkgqCDlsWb8OpRVI18nBPLWlsHHeaXkq5rHP
         H3p6up8feo5djwsIrR+KQxh22Hc4IXw0f0z+LHeVinZnn+OGZzup88vpDovYgh1mjWOQ
         Kxcg9r7VmPHqSg+4y+BkBCxHMLxd5E2Em4z+JCpRFMeBtkA+eNs/6yNRdOn52NivDtKo
         30kU2D827Y0RVPaWseyFdzWkYkH7FvEwCs4FTrQy3AZu5FlVp9VzGDNx2cv7Eh87mq7q
         HSkEq9mIIwj5ECYKRLGgh+y8YsQXvqQuZs1sKLe4C33LWJlg76a5jiBYis2zOjhIaMHy
         5+ig==
X-Forwarded-Encrypted: i=1; AJvYcCUC9YfLPKS2SY5dXpcCObmX0nHEadvlSmLxj3qxA74bXKX49nTkxvJ877NgCghMaTGc/U0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwoDcDzH681aW04qOzxsZyngjruitwrQR0UyT9tiiWedMCONvjm
	EMnvdjf3WYplZ0icSWFXUP2Iwep6CHJSaaF/ASLitIXZxZFz5/EnTZzBF5bV8FeT6edZ3aV7W7p
	RzjDly3uDTHn3ukXnvMY2L8zSEyM=
X-Google-Smtp-Source: AGHT+IHWJ3Gl3iN6upW/xxoBdlO0OWmiGDOdQz067boFUijDPyhwnph49wuV7rSiEbAgkS+eDSaitUYDzgrHe+UgSi8=
X-Received: by 2002:a2e:a9a2:0:b0:2f0:1a95:7106 with SMTP id
 38308e7fff4ca-2f4f579e60bmr125895581fa.39.1724769142498; Tue, 27 Aug 2024
 07:32:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240827142458.265558-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20240827142458.265558-1-alexander.stein@ew.tq-group.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 27 Aug 2024 11:32:10 -0300
Message-ID: <CAOMZO5B32Cn6qa3Zqe437pqTZ77bpCVMMtzhH3xzj06x5G5MQA@mail.gmail.com>
Subject: Re: [PATCH 1/1] ARM: dts: imx6qdl: Add reserved memory area for CMA memory
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux@ew.tq-group.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

On Tue, Aug 27, 2024 at 11:25=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Default CMA size is too small for HDMI output and VPU usage. Increase the
> default size by providing a CMA memory area.
....
> +               linux,cma {
> +                       compatible =3D "shared-dma-pool";
> +                       reusable;
> +                       size =3D <0x14000000>;

Just curious: how did you calculate that this is a suitable CMA memory
area size?

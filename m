Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6801448E0
	for <imx@lists.linux.dev>; Thu, 22 May 2025 14:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747924348; cv=none; b=eV3tX8MWd5c3S5gKBskoqn/rqQCiARg0M9UJ+ISlqJAv5RJvu/lVXcchZK87fU1w2J+nIo9+TbklHWkxYv8/qhpj/XGXdCdzAsHnIwWB8g9btNmTwOtLmK9FJBv2z8um4sFnSfTEVarotGTeTkPIeLVEjYZxvXltT9wKj4gRoUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747924348; c=relaxed/simple;
	bh=OGjaJfhABvgVCGsd3tFad+QV9xCQhZ9TN29ZtSgkRyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aids1BjKQ3VaOM7KIy3EEVYcZe8xV39L4WZHmMoyluYyZtS8zGvd5u81iGkVMBVOiu6ye+8UPyJ2c4IuoegaCpQJ2T9SQciqCMncRJQtyVyQf2BfiPG4SBPxT0IkoMJC0zgLWwjg6eo5NspmAMAvg2B4XPxlAacLIT49AnCYYQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1O0z8Bf; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1O0z8Bf"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-310447fe59aso82178231fa.0
        for <imx@lists.linux.dev>; Thu, 22 May 2025 07:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747924344; x=1748529144; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGjaJfhABvgVCGsd3tFad+QV9xCQhZ9TN29ZtSgkRyU=;
        b=E1O0z8BfWBHm1TuvhAI5GP5uEfDnE/Dl8WjYPydjvAkABgpl6o55MfzCLp0E+gpIXx
         l1s/aLWdBpGDpW6zYCmdo3ihRPgjZ0YTlSed82ck55CMe7CCkrNMg5jKdUMbpxmr7/Zw
         joqBhoZ1+l7/s/XgNClSE9TTYHAck674LvCctZzRznz2vIQli0NZIdHlRRa7JVketYj5
         uTIWo8KQrWIqvT0hX7Vhr72vaZxEHUvsa6H17TZRO/W+TwOhYk7+90Bg4+8ydVVRB5Yu
         ah7Nxzx/wTQarTetEhHlRt/BptlL6RnsEBNrr8Nj06dcgxSA4wRukDjSw3JsH9ebp7o1
         aOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747924344; x=1748529144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OGjaJfhABvgVCGsd3tFad+QV9xCQhZ9TN29ZtSgkRyU=;
        b=MQuc4BWX8G4a2nbcgPpqfY/S7zKhjSP/KN0M7ZacGq3KOPyAmDFwMhK6rwB/w8S8TY
         DWLTbh3mxIgZFEuhAd8Zri0O3VE8TiNVovAP+Kg/RclWmgW+2Y7om75Xl0MH/7rLp46i
         xxUft3kJ4biZ2wGWBkQvyUMvOODH1c22UNIj+dbBlNmu6qnVm7IXMHByJex4dHJdRpkW
         Al9UtcoK23CJL4VpZVh703SlZFe1fSRA3TIzMHWi0bfxeWV1qx9doG7G6wIDDFdtGDN+
         mReUmpa7YQw78YY5YOLc4p+gqgwb5A3PIwQsy3vThLtdGNqkSKlcG2/8GUDthASkev6h
         rlMA==
X-Forwarded-Encrypted: i=1; AJvYcCXP8FtvEvTbSsHdB5X4BJuBJPZjGraHFFAkAjjtY2kiAQFSchUz0a87q3aYs90dutPeOTs=@lists.linux.dev
X-Gm-Message-State: AOJu0YyTMxc+EVZsXPMGko0GjkPhHwXhQY9OBL4NeCxcxDkL3VwOmE7f
	Ri9YaXSjVxr4JiceN8F/vByEAHVzfK/qvmCWtYRi1zTj8+a9zuVN7uh3Xp8cL50dz1YHL/8EzKt
	cVBK7bqVRvz5HjGC9qy1S3C894U00Gw8=
X-Gm-Gg: ASbGnctewFOz3HqzDRlUyp5Pmdu4jjNBX36ONTRYVBXMNSfL4q+iAjm8n1eeau4rR+f
	PX+OUIl1Y4s//wmzFdB3dZSHZuBbZ5soPPGzkLeXZ/M6a1MHTeXyRvNUoCLKeUyED4vhvm0m7Wz
	cyicZzAGMPsC4P+n4tWJpWgsttlCpzzOYoOMIi+bMcF6yIK5Ic1XndWZ9oJ0aistM=
X-Google-Smtp-Source: AGHT+IEaZE1lp9L8I1XpxLuDmVxE/BSvCemmHIZkmr/5NnE6CTH32YEGW7LlVFpP2G3fc1oPzmkQFN5oJlhNcxT/MYI=
X-Received: by 2002:a2e:a98e:0:b0:308:f860:7c1 with SMTP id
 38308e7fff4ca-328077a3117mr89859901fa.30.1747924344394; Thu, 22 May 2025
 07:32:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250522-djrscally-imx8-isi-fixes-v1-1-10bcd6d347a6@ideasonboard.com>
In-Reply-To: <20250522-djrscally-imx8-isi-fixes-v1-1-10bcd6d347a6@ideasonboard.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 22 May 2025 11:32:13 -0300
X-Gm-Features: AX0GCFufK1yPw-pz3POhVgPcevjDncZ61EpuRdPKFDM9n9SEGr7Bk_wTDX8Uy3A
Message-ID: <CAOMZO5CDR1LCmmAp0eRFnrC7LNS9WjOaQhRi1RzC_ZU07O4oog@mail.gmail.com>
Subject: Re: [PATCH] media: nxp: imx8-isi: Cleanup video device in error path
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Thu, May 22, 2025 at 11:30=E2=80=AFAM Daniel Scally
<dan.scally@ideasonboard.com> wrote:
>
> mxc_isi_v4l2_init() registers video devices and v4l2 subdevices but
> the video devices are not cleaned up in that function's error path
> which means they're left hanging if it fails. Update the function
> to clean them up properly.
>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>

It looks like this deserves a Fixes: tag.

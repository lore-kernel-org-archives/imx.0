Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F80126ED33
	for <imx@lists.linux.dev>; Tue,  9 Dec 2025 14:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765289269; cv=none; b=LsBenAjVwQMb8bZpmcDDrXqw+wrX9eFr3w+tZleVoQIvsmWk9vm5jnbFhRGfhMurAe7zAf9KRuEzVpKRnVX9MMS2rQWxFQZAvNXMr2FyX6Jrtj+CFcZXDTYB4Z510QIzWtwfRorG0755qf7HLrj/c5C088hJCZN5HLTfqxDLt5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765289269; c=relaxed/simple;
	bh=Dmc9rdVFoScFVpQrBHs8ADdcFVIv2yXnxYpPhE8hk44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W4cIM181TPYGpiKzewALpcZ+2lBwjtUJfS/kGfq7MVgI8tJpJ6Valf1ZSYBiWh5Oa5b3ZNl+eW1jYt8JH76w8DEZTZHlIjSHCg8JYdEnZQwwZyDN+DWX7OJ8/MR6D1BYxly1yDxpr6q45orPHbEdClFmavns+wsDwNfSdTNsNxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UReYihAS; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UReYihAS"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-295548467c7so73657635ad.2
        for <imx@lists.linux.dev>; Tue, 09 Dec 2025 06:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765289267; x=1765894067; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dmc9rdVFoScFVpQrBHs8ADdcFVIv2yXnxYpPhE8hk44=;
        b=UReYihASLfNniHCKoVsOAYldMktJAhQlOVHjmTmvFV+VkRLMogoNE1SPe4azP6ad/6
         BVmletZLSFsmST4W2EQGLj2g/NbFbsFhtxNOK6BynoLyL+gwTuuqe7Drtfqcy5CbqNCI
         fj7OgXTuSHxfXA3f6ZmT23x87OWtrwv/SvexFg7RtmVJa2HFSMDeD+qxQTh0ljzsvytY
         W9xdZj5WLj1cVD8BIEqJNFVr6L2LurC1K5gRdrXWW2geKda9SmchEck5DfNM7IYZB34+
         99oJ523Y7v1Rzc6M5Vuxq+rsscWJtxFcRwitxM/PFB0sXEm0HbCbkFclwUDc1s2le3Er
         2x1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765289267; x=1765894067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dmc9rdVFoScFVpQrBHs8ADdcFVIv2yXnxYpPhE8hk44=;
        b=GjFYbMGgFlKXgkkigIuXYY60QUgVMwUFAhA39YuSI5ysWMW5r0cO+lUgnNgN0m2OKf
         2eOZv04uZGbBsYZpnLciKXePY3TRJPF3LRGJhGdQkFqxqRA02LGAdnKJRp87NobAFL0c
         ZhN0IMf/Up2Pc73nAbKGXUz/lcOS0F4VkuWvZUEE0nJbxqe62hE2j5BrzYAPsNB0kETt
         9rx9kF6VnTrr+YZc/S2P0qKnu6PdMfBbA79nIDUEjAHjIBtcBMU3TGo9AqPAgJaF562W
         ON3mzGHb8Ho9TVII50YOcDrQZdY963z8PMCSCbu6ij3Uo59/viMnfQsCqps1l25HYG7m
         OQPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbvB+U8KRb5t8IubW244+ywRJd2berlN+mRIO+Nc73/iVumAssA9oUcQqRrp5z/K4fd3M=@lists.linux.dev
X-Gm-Message-State: AOJu0YyaiUbeFjs+J2o4l9c4SbX25e0ocHPPXqOu6oU1qTE5TugqO9y3
	AcizQexvIYCXin7mXOOhhqPCIEMOum3EGt2562jEiqn/ZHx+N70fzQlT3nRYU7l92BAF9y3SjsR
	dDdsZZntwX3krgOusP1GIYxgBYP9qAuo=
X-Gm-Gg: ASbGncvsIXOzKmvSHYFl3siKyrOpCNp6S6o20kPqTeJF3NEQ4tprQOZCsdHXLnmvDwC
	O6L+nlEfSFp6b20R5n6CTFYx7c1vX/PfNboq0sVMCs0Cdcca23QjfT2x8M/UiTSsFO0do/kt1nk
	N+ljeSkw+2e53k7I+xmKwscne/n4fBTjWDU0ch+9Z2FGxAMkPXhQuop392uU42sUGwrRHptDXdS
	n8tup1tkBaJprjk3NOFP1OV1XlX2GGB+CvS2jySGrQSsFf5N6b1N0hcowWxt2c+gmgVrjtzWw8J
	SDe9/4drMpjqMwnXq1AJPPkGCVxLLUb2v1kK+T39AaVIRtkUn4dBkJX01G11h4FGptKbDqZKHn2
	X1zOie40wFA==
X-Google-Smtp-Source: AGHT+IE/MNNz7wtG6bh2UZGMnD/oVNJ1TejvyJsrOq0p5iLxtYXVZCkZRmEenluo/ZYsAAS0ErkexZjLZxTzyvUOaTk=
X-Received: by 2002:a05:7022:a92:b0:11b:9386:a3ca with SMTP id
 a92af1059eb24-11e032d8b05mr7860628c88.43.1765289267225; Tue, 09 Dec 2025
 06:07:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251204122825.756106-1-iuliana.prodan@oss.nxp.com> <20251204122825.756106-2-iuliana.prodan@oss.nxp.com>
In-Reply-To: <20251204122825.756106-2-iuliana.prodan@oss.nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 9 Dec 2025 16:10:13 +0200
X-Gm-Features: AQt7F2pD3HTByIx6cmrNP1lp33kbo_jsvfA1vDQn-Zm1XLkckJBpR0yk-Ns6YM0
Message-ID: <CAEnQRZAWAJ03u9LP33MXizJB6Rso+nL2FvRSKZE0Hx4o9ak+Uw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] remoteproc: imx_dsp_rproc: Rename macro to reflect
 multiple contexts
To: "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	"S.J. Wang" <shengjiu.wang@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, imx@lists.linux.dev, 
	linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 4, 2025 at 2:29=E2=80=AFPM Iuliana Prodan (OSS)
<iuliana.prodan@oss.nxp.com> wrote:
>
> From: Iuliana Prodan <iuliana.prodan@nxp.com>
>
> Rename WAIT_FW_READY to WAIT_FW_CONFIRMATION and FEATURE_DONT_WAIT_FW_REA=
DY
> to FEATURE_SKIP_FW_CONFIRMATION. This way, the term CONFIRMATION covers:
> - waiting for firmware to confirm it is ready to start;
> - waiting for any other confirmation from firmware.
>
> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

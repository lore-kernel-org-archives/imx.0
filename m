Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476E16D1B5
	for <imx@lists.linux.dev>; Thu,  4 Apr 2024 18:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712254465; cv=none; b=fhbB8tcmY4diQYgVngVEa+oYA2Dy6cgxCzSpgq2Xc9Of/xHr0c0MQDGXCpUrwKr/Z5y/9AClRuiF7sCOscprtFwEfJJV9PMrZO/QehkJt1qD5tqF3JeJOHFTHV1piE+JSmU/C5yhxIrhF5SXwfxoauYRoSwgNccghu/dBaDuwpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712254465; c=relaxed/simple;
	bh=e5zxEreezdNSv6rdlcd86vOm3RZlnS4eg4FcrcnzZ2E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L2aVSzFdwM6WBl6C/5HZLO1kWpLoaNyoRUYzsm/xI8UqlRWJL9+3G4QvFxKEJKDLMS6HMgCSY0i7u/NWgxWy4tJRhs7EeShzI06VHZ5OcMwg/1ErwQrVZJoTpQ5F/fNRbZZs8uH+uMmlCAxRB3OoUljD3rs7D1sD5frtV9ZzO4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=O4PdPW8N; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="O4PdPW8N"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-43446959b33so5261001cf.3
        for <imx@lists.linux.dev>; Thu, 04 Apr 2024 11:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1712254463; x=1712859263; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iLUkwMhnJgPR4LpTA3Lkdoto0zzMxhl5w3AfTc13Zqs=;
        b=O4PdPW8NKpnE2FNTtJB6it34jv2bQ+kpVuWw1SGQI6HumcodbfaGiin7tgPZ698p8T
         /UR+NUi4PDfm1uXCW2YH5iiC2BH57YAH+3sB3kOgLX1D2xUYOPnS8G49CDBsuNvtNFVw
         +T7ROdmCl4o4ctV6AEt38etK+Qo4LDFRWur8+uFPNOwCUBIC7WD3Ws1Rg3S4rKvt9IGE
         vMGpp0CiRbZLFD5ERuBmRmuOYsnI2Q1+CiwUh2Gz8DVLNg94z5VdcvzPYBGrRcwLQt79
         dG4pM0KuRz68H1g0vS3PyFRmJr0GYZh2MjxqObKtLJgM+dAYaHR3jSmcfYfVLsxEGCxo
         goOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712254463; x=1712859263;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iLUkwMhnJgPR4LpTA3Lkdoto0zzMxhl5w3AfTc13Zqs=;
        b=X9C9aNxn+2SXX+PiDEJf7/P/xSqAduo98wEAnPecY7+NQwHkv02Lkn76FU/6U9avZC
         UryZKBLPknFFIV37FdYkIyhfVjwpB8gbZFPTWkZHpR7mz6YIgdJJ2tdqogAkBYAqluEf
         y6w5rqtp7rD4fbShUyt5h3shaVlrHxMVlnrzHl6fepUCAsJ++tHFwtZgz6+O27ce3na4
         UhkhNDR1xPVm6ad4u5QmBcSNtgbER0G+UuCCUKKNqPehnDDldcrkMNwWZqLkl7Q8IgmA
         o2UPjbg9YS6vbva3kmv4+/JB9Euhb3UI7n28qatTWScAQdcv3PF/eCD5ambTG/VKhvoR
         sxDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWi9cYMvr8cQQ+jsRUJP67coBUkh1f+87q/duQIzMAgDiJSbt+q0EsOLjPtFXyB0XEv5C9MRmMtlvMxPNT1K1QmOZPV
X-Gm-Message-State: AOJu0YwSHrA33YFfAlX8ZUw/B1iozQJMT/NVvna6I8w1ZZB68XMN5LT9
	6OEQCVpw2L8guxlU8Bfv59tugqgEKPDuD+X2Y77hHYcoBaPX5HXBB45PUHceuCc=
X-Google-Smtp-Source: AGHT+IEIVqq1yweJQ+9a/M7UnAUqllb9/xLGWZdymaOlvKqAMzFT/w2XDbtmeS8HrnqiNFVdpXYCvg==
X-Received: by 2002:a05:622a:1895:b0:431:83bf:68ba with SMTP id v21-20020a05622a189500b0043183bf68bamr3381299qtc.10.1712254463234;
        Thu, 04 Apr 2024 11:14:23 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2606:6d00:17:6448:fa75:a4ff:fe45:b56])
        by smtp.gmail.com with ESMTPSA id ck7-20020a05622a230700b00430bddc75a5sm7780034qtb.23.2024.04.04.11.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 11:14:23 -0700 (PDT)
Message-ID: <5fc25468198cb3a228b91160dcc490600e1197d4.camel@ndufresne.ca>
Subject: Re: [PATCH 1/2] media: v4l2-ctrls: Add average qp control
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Ming Qian <ming.qian@nxp.com>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl
Cc: shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com,  eagle.zhou@nxp.com, tao.jiang_2@nxp.com,
 ming.qian@oss.nxp.com,  imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org
Date: Thu, 04 Apr 2024 14:14:22 -0400
In-Reply-To: <20240329092352.2648837-1-ming.qian@nxp.com>
References: <20240329092352.2648837-1-ming.qian@nxp.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi,

Le vendredi 29 mars 2024 =C3=A0 18:23 +0900, Ming Qian a =C3=A9crit=C2=A0:
> Add a control V4L2_CID_MPEG_VIDEO_AVERAGE_QP to report the average qp
> value of current encoded frame.
>=20
> Signed-off-by: Ming Qian <ming.qian@nxp.com>
> ---
>  Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 4 ++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c                 | 5 +++++
>  include/uapi/linux/v4l2-controls.h                        | 2 ++
>  3 files changed, 11 insertions(+)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/=
Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index 2a165ae063fb..cef20b3f54ca 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -1653,6 +1653,10 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type=
 -
>      Quantization parameter for a P frame for FWHT. Valid range: from 1
>      to 31.
> =20
> +``V4L2_CID_MPEG_VIDEO_AVERAGE_QP (integer)``
> +    This read-only control returns the average qp value of the currently
> +    encoded frame. Applicable to the H264 and HEVC encoders.

That seems ambiguous at best. What does it mean the "currently encoded fram=
e" ?
The OUTPUT and CAPTURE queue can be holding multiple frames. For "per frame=
"
accurate reporting, I feel like we'd need something like Hans' read-only
requests proposal [0]. Its basically a mechanism that let you attach reques=
t FD
to capture buffer, so that supported controls can be saved per v4l2-buffer =
and
read later on.

https://patches.linaro.org/project/linux-media/patch/20210610113615.785359-=
12-hverkuil-cisco@xs4all.nl/

If this isn't what you wanted, we'll need a better definition. It might be
helpful to explain what this is used for.

Nicolas

> +
>  .. raw:: latex
> =20
>      \normalsize
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4=
l2-core/v4l2-ctrls-defs.c
> index 8696eb1cdd61..88e86e4e539d 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -972,6 +972,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:		return "Use LTR Frames";
>  	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
>  	case V4L2_CID_FWHT_P_FRAME_QP:				return "FWHT P-Frame QP Value";
> +	case V4L2_CID_MPEG_VIDEO_AVERAGE_QP:			return "Average QP value";
> =20
>  	/* VPX controls */
>  	case V4L2_CID_MPEG_VIDEO_VPX_NUM_PARTITIONS:		return "VPX Number of Par=
titions";
> @@ -1507,6 +1508,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enu=
m v4l2_ctrl_type *type,
>  		*max =3D 0xffffffffffffLL;
>  		*step =3D 1;
>  		break;
> +	case V4L2_CID_MPEG_VIDEO_AVERAGE_QP:
> +		*type =3D V4L2_CTRL_TYPE_INTEGER;
> +		*flags |=3D V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY;
> +		break;
>  	case V4L2_CID_PIXEL_RATE:
>  		*type =3D V4L2_CTRL_TYPE_INTEGER64;
>  		*flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-controls.h
> index 99c3f5e99da7..974fd254e573 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -898,6 +898,8 @@ enum v4l2_mpeg_video_av1_level {
>  	V4L2_MPEG_VIDEO_AV1_LEVEL_7_3 =3D 23
>  };
> =20
> +#define V4L2_CID_MPEG_VIDEO_AVERAGE_QP  (V4L2_CID_CODEC_BASE + 657)
> +
>  /*  MPEG-class control IDs specific to the CX2341x driver as defined by =
V4L2 */
>  #define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)
>  #define V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE		(V4L2_CID_CODEC=
_CX2341X_BASE+0)


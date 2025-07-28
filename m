Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F39D24469A
	for <imx@lists.linux.dev>; Mon, 28 Jul 2025 10:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753699051; cv=none; b=NboJu8GjP+EGOgdQm4jifkeyqwfdbopsSt+TV/2J79Xjq+zcqbBH9v6s/0XuJ+HcrFZ6Jnzla9x2nLyYABZlOrG1EBQH1SbI3/1if4YZJBXpFufVCf2CPc0fo71CuMWmhvIgPbuhYPJmbLGUMLil6acgQTDfU/TmXafMj00TyYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753699051; c=relaxed/simple;
	bh=7Is8XXTNOyILK+r8f7Gs6c1X78jzKDdIzy2diFsj8A8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fmJcnSDpRViLv2bhLhCGT9Crno2vXw2HF6TOuL9bCVh/F21YNN4LZ97UJvP9qarilws+/EMBJ7ipIIQZ9ZAvGhBxE+qLb+SAXBMe5h99HlCwBYwthoiDsnNA8a7fmDLkhOoY1YGpGBxidoYA1NEbduj6upnNxzIzljAyErjvSC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j+KDMLMm; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j+KDMLMm"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-24049d16515so2484495ad.1
        for <imx@lists.linux.dev>; Mon, 28 Jul 2025 03:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753699049; x=1754303849; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Is8XXTNOyILK+r8f7Gs6c1X78jzKDdIzy2diFsj8A8=;
        b=j+KDMLMmtK7cmjMPNDKhOrjz8Mj86/a4tDWHrwGsauAvpo+eda+jzYvvzS2A5+rfML
         x9zOtqjQz0SnVykVe/tAp+BMZeIsuEI3qWoCQM5wljHYkZsHFTFvlR66/WHJhr7kGRDR
         gH1Gqsqn/h7ALt7PrthVGOIwdqohB1SvG6+gU3fzEdHUzdAxgp9xEnNGK3zvH83eMW4f
         76RFWTUTgUrFikhnEW/Bom1IEEkC3hnKth4gpADoM3+Zg0ev46eJpu2U+2OXWkWfWbDS
         luXeAF+KtRff+LAtUATTvz7vW3L7/VPv1bovrFVMSMs1u0DiesZiI+68c94fz9cuyLL8
         hV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753699049; x=1754303849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Is8XXTNOyILK+r8f7Gs6c1X78jzKDdIzy2diFsj8A8=;
        b=PlomCsYjntVAsurZq00knoVmurLQuMh95nmUhpjFzSfDkmV8CZ169jpkFi7YZT2hoJ
         cHiNYZZsh7CEOTekwxSKZfSoyYdQp3v+l7xDYtXAPt2ygrHHUdD5ZrovmpAKQVUyfela
         e96jPx14jlLeRqIjRKxAW92or4Zx3hFLjjfCSWqCDQyv51XM40RsNQ4e4FhMx12+Qikh
         ZGnOvgn8sGBp7L9U4YKMwOW8/JhIT+MpG5kA5CodPFP96AwH+3l43WVAXQIV7Mzqjeg2
         fj1o2hdNigJomPrh5ooocaBthtEzVk5iP7+iNOjI+1KPkJFSdPNMq8H72v5td7e/JuL2
         U1gg==
X-Forwarded-Encrypted: i=1; AJvYcCVVPO+Vfe2bqDYWZ4m8KGtxAVtvvnDj/j0/zUrbz3EFyzquxeoPQ+u9QGNjf4YT8uVPTUI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyhaFbsi08mL8ZXi7v2OtvzvKCJp5HLJb6J2betD8mBY7QTTCdV
	dpJ/pMYHFxY2lyH31zSS4XeJbK8ZwHD43RI4wRCfpkH77PG8BdmW8hYH9Cc9PUSYJIwvHjQkFpK
	B0T5itENMf58vzFH+oQC47kVqNlX429k=
X-Gm-Gg: ASbGncuRY1rjoSwEZChFhUpR8YHBS5l4deikkysvDmnRyo3PiKD2lsv33pu2vuwdHJw
	E/wUqldvRYRkyXaD7WscUoVPiJwJ3V19WbhdrS/jcB7VF6aAwBV4KzYWTjK8x0BTd0VfBnbSXuu
	sRDt8NwZ2aT2qm89cGGdmrLIrLbVP2qx+cgmkYvYkPMH7ApH6UJgHQZdeK3zdw6CIAJFKBIO6cq
	4hJ
X-Google-Smtp-Source: AGHT+IF4QGVaLVSA5ClJtUhy2ZGKo+uZLc9uhqMBNSoOZOe2mbNHozP/VopVOfBiabKiy2Le+9KmLA59gGymrhaOPLc=
X-Received: by 2002:a17:903:2351:b0:234:f4da:7ecf with SMTP id
 d9443c01a7336-23fb307c7bemr126693305ad.8.1753699049378; Mon, 28 Jul 2025
 03:37:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250722075225.544319-1-shengjiu.wang@nxp.com>
In-Reply-To: <20250722075225.544319-1-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 28 Jul 2025 13:39:38 +0300
X-Gm-Features: Ac12FXxqLG3fVa6F9gxX4BalbdOcd_A7WEBuWW7PtouWA-80m-MIDVezM3ly9Hs
Message-ID: <CAEnQRZBc2X6Yn0X+RbJ9-OSxovnHvoqJ3NXsJKBkuH82GNSAHA@mail.gmail.com>
Subject: Re: [PATCH v3] remoteproc: imx_dsp_rproc: Add support of recovery and
 coredump process
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2025 at 11:16=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.c=
om> wrote:
>
> When enabled FW recovery, but is broken because software reset is missed
> in this recovery flow. So move software reset from
> imx_dsp_runtime_resume() to .load() and clear memory before loading
> firmware to make recovery work.
>
> Add call rproc_coredump_set_elf_info() to initialize the elf info for
> coredump, otherwise coredump will report error "ELF class is not set".
>
> Fixes: ec0e5549f358 ("remoteproc: imx_dsp_rproc: Add remoteproc driver fo=
r DSP on i.MX")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Changes looks good to me:

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

I've tested it with Zephyr synchronization samples inducing a crash
via debugfs interface. App
can recover correctly.

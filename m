Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EC6332EBB
	for <imx@lists.linux.dev>; Fri, 21 Nov 2025 09:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763717317; cv=none; b=PmBFelv3CAJ9FgRYMVywNYZw0mgFZjm1FnprY4fUkStx0cfmec9+qIv7FE094FVTyVbc0gSDa+cG/+UbkLw815K8u8YUEzUHOWeKhiUU4yBC35JVgdnr2kMdA9v6y2TQfGbvcn9D1ZEnol2SnHth1knZ+1vkKAGx357ABRNAJEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763717317; c=relaxed/simple;
	bh=tVpi4KRfjiWBMscTlH0jcjffaJeuhPgxmDymKm2VoQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O5pn3yJRYmTEGbWhnHU2mUUeKGvyxcBSoyT2nM3n2AleAICyOTCoZxJGMLw8vB3q4n31cfFe497eh6CflPMglflETbUjROJECKxl2oKDSSZe2l0hzf2H48GlDvhvixYc0/QSHz9nOQT4WTfYbnEwi3joVra9J9PlCx965Aiq7X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jcbhwpVN; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jcbhwpVN"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2a484a0b7cfso2768202eec.1
        for <imx@lists.linux.dev>; Fri, 21 Nov 2025 01:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763717313; x=1764322113; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tVpi4KRfjiWBMscTlH0jcjffaJeuhPgxmDymKm2VoQw=;
        b=jcbhwpVNtRP4qLxT0JcT5BVsbppM/DX7/0oMg5bggRuNpSrMlFIXf8aGsaIPU5XDda
         wsFP89QTOJSncrqq2jo4BtjA37feYi1l0HXD3jcwvZm5gFjvhk6WRoASw9MZdLGmGj+B
         wjGI/qmAvvPMtYEUTeRiZH2J5x3Ssd+mB8H7Kc9IrKZrtCBHM7cgay3o4VcL9bCuh8J8
         /7tZYzFVMezbR8lCMVrmGn7Kijmx5qn8l4GJ8ts9W8lOaaoh01HUPoHITXcYM6XpCIEu
         DqxMlyxfjLWWUeFZVJ4IX0B/ivuxPI6HF65IhjOJSMN+hvb76gL4gJPBnHUiZErtxxlO
         qNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763717313; x=1764322113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tVpi4KRfjiWBMscTlH0jcjffaJeuhPgxmDymKm2VoQw=;
        b=qBsR4O0g1B2qhu55KuZnM2nQ8tWHCPdF6zdQJ/QtdkzBQCDFOuKSh0PanDflEQQZo1
         5rczZIf1srOhsIxAlU8jZqaiSX7QJx/IgtPJ0aA304dUWiMHlgG3o6OlMPbtqg8Fll1v
         MzqqrvCetdXO46hDijHy6RC1meUUhAJuZHtjQ74OGEdzkB9CvThqOFHni6ixdIueiJLp
         6jfpX4uEq4hmY/cPNJwprqIuDMmbHrMfTX3WMdgxoQv81ltxgrSf7SL8IKEJBGp4TsPm
         0BEVNaV+9NQMtDVu2qEiWbEFwMr45i6vF/+pqW8VZ/CeWnJfK9jscOvWQ3klxYxTNFGF
         wPNw==
X-Forwarded-Encrypted: i=1; AJvYcCX7eewuQaQSexpzteOZKkPA4wLs/PV9W3bCfyy7a/yKMVk6VLnL2LTUEME1KNVts54qbxA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxR2/K/+aTgn4Ri5W4cybg8WsLA5O6JIMpzz6mfrK/5+cZc2uNr
	XRts1Huo1wv97SgBk37NkCtphak13Hc35CKbqrYBWeuwaI3rjk7FkT/2LTdxzrlFA1JQesMJxJ6
	F/cAaNBgt5uqFv2R6h/LduI+n3TvSDUM=
X-Gm-Gg: ASbGncsaoDfsJLVbFa5GMIKAQB+qybLxEO0BkdmMoEvpcXyR4S3VNyWF3mUjubhYbat
	RxUbaJULFIuBjksBj9vUO6H2+v1mmWZI/W7fkxrOE4tbHwdRco/415h3dCIS4jTa095ouUfCdXs
	y4f5Ismx+Qngmg8w0JUEilHenRMBhflT0S0u2ZVNQceJvCNHWcv3uRAv9ux/LnOj876GItlLEuY
	unVIBHNHzjeZu8DJ0C1AywE06DriweBIFdxu+g6evscMvZV4H27+eWMR+7SXP/LRsfyGQVgWQpi
	Vg5G5gxyuUFZwMIGqnfkuKYr0vY7IFnRQ0AtaK2iXuZIMdo/PP+pZTeP1490NaXzbBzy7L7gqWf
	ut0B17/wgkA==
X-Google-Smtp-Source: AGHT+IENwKl0uRm0AtfXY5xBvJH2Yq97sqz3IFZgj0rwmGn72hcMnayFF+NHDjS09wLJLsAjZiLl83AxVJTK5qa6VOU=
X-Received: by 2002:a05:7022:6285:b0:11b:a8e3:847b with SMTP id
 a92af1059eb24-11c9c9363d0mr629231c88.5.1763717312963; Fri, 21 Nov 2025
 01:28:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251117030355.1359081-1-carlos.song@nxp.com>
In-Reply-To: <20251117030355.1359081-1-carlos.song@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 21 Nov 2025 11:30:59 +0200
X-Gm-Features: AWmQ_bnpiXdnOIi4lx5r0cxLjLdNMoZvteBUNmZvqdAN1a5gmVjrKg7KONGHfzc
Message-ID: <CAEnQRZDwPxRLZDy0+s2og15=C0G6ZnNPUEstuFTn5JLSFajJaQ@mail.gmail.com>
Subject: Re: [PATCH] spi: spi-fsl-lpspi: fix watermark truncation caused by
 type cast
To: carlos.song@nxp.com
Cc: Frank.Li@nxp.com, broonie@kernel.org, rongqianfeng@vivo.com, 
	linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 5:06=E2=80=AFAM <carlos.song@nxp.com> wrote:
>
> From: Carlos Song <carlos.song@nxp.com>
>
> 't->len' is an unsigned integer, while 'watermark' and 'txfifosize' are
> u8. Using min_t with typeof(watermark) forces both values to be cast to
> u8, which truncates len when it exceeds 255. For example, len =3D 4096
> becomes 0 after casting, resulting in an incorrect watermark value.
>
> Use a wider type in min_t to avoid truncation and ensure the correct
> minimum value is applied.
>
> Fixes: a750050349ea ("spi: spi-fsl-lpspi: use min_t() to improve code")
> Signed-off-by: Carlos Song <carlos.song@nxp.com>

LGTM,

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

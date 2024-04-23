Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6347E101
	for <imx@lists.linux.dev>; Tue, 23 Apr 2024 15:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713884454; cv=none; b=Ymuchk6wD0uXl49GJUN4KgxSoNy+64aZ+aVbLWWnkj/5AyGjbS0HgVknsEQiNr+QSQSf9g4X/0h5NJbsJJEcwKpehycZ0JBu8u7chSHax7xuiBoFOGcAgH3QU8S9fuXSfcegmzkrM2yvCSaFQW991PVJET78346kAVVpu6LGTG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713884454; c=relaxed/simple;
	bh=hmeVqi+qrZVt/f7xTxCmrGrnQQUbPC9ejTbVnnleWpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P8omm+nmTUe98QJZ1C90oVpBW7uzi5/E2em4rJMwPrTolRip4uvrrhFxoYlef5U39k62SFsXdcYZ9uieJ0hBrhOXhtUXiV0TheQNSRczb61woJOJqAMfSayL7Y0q2LwBqaINIuA8XxvrWf0tibeltBWzZk5Hq0hIm7EbXQH060Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VeMTGdE6; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VeMTGdE6"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5fd7110ff4aso259912a12.2
        for <imx@lists.linux.dev>; Tue, 23 Apr 2024 08:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713884452; x=1714489252; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2wANaF47n6On5+vFRcN7v5yzxObci+ACRKNwWYJyNE=;
        b=VeMTGdE6Le1oyDmyuUJk4ZXdSLGbwT0Kzrf8B85XL9dCtX0YHIFtiNphw7dqVEPy3l
         Kxx9+AVZsfSPOM3018YVH5L9butEgeiQEfLrETiZJk4dWuqGLitpga9CquJywd2kDnT0
         BXXUoZOxcp6gyWQACjAJunDMq3/OKQdA6mswuBmb5BUrVsxSTCq+fZKD+y0AYwdfRU/B
         tGlKA2KqV+y5IVYXbStotvDlubwVplaFE23WPdigHjvqb133l5Fl/sWytYR1RZYk4Cxu
         baB0deZrPsqA1rmYt4UDPZWDyIVwedGul05/gr6zyjyB3QuvbD+eGooDYQBbqZkoJKoO
         QUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713884452; x=1714489252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m2wANaF47n6On5+vFRcN7v5yzxObci+ACRKNwWYJyNE=;
        b=Ny/mR0hgPBunVMzdMigQnSao3zPh0Wm30Y6sKqS76+VtxV4RGc83LeXZP0Z4xPLefQ
         UYxweqC/DE4XgJa8T96tAPxur1N0fYr7cFq56hRoS++VzWdK16gFzhcfP+WjQAIqiLin
         pJ27mDlLJnQ2CF27m12oS75CC3ol/WAWUgBhST3X42u/SKSLSS4T9ng8e74PA67zCW6T
         s0qop97952MFaRHBNcJ+LuYtbo7qlCMpp3scU9+q3ueaKhrt4glav2yX5zk7tcB+pPw4
         9PDuviQQF7z+agwL7YSEMCDzZEYUhrOkI1Xdzj8I/LhmalIy0ozl9his18oXJDr6YVo/
         zRJg==
X-Forwarded-Encrypted: i=1; AJvYcCVOAJSnMowPYb0KLh7p1aLl/NXNuhs1Xgpg4meSWH5Mp58WF9R9j/xV1d2t5GDSwNFNMLoL89rF8zKV83d2dwXw/plb
X-Gm-Message-State: AOJu0Yyq1kERY0E7+XZoW7VtMF6Zpf9eoRCrImsd/tTNYXZNVdHJQ43j
	ttauqR47R01zLNsSaM89QVgfrWdb2PPEoOIcW//K8Gy5WoH7MIyLXNVzSGmjn5e2FAwVCKgpq2u
	TPQy9SJDAYXEukLBhHtATuTyFqCs=
X-Google-Smtp-Source: AGHT+IFn2yuRMGtnCOCZ9haIy6asgB1VJISBJ2JWZDYXPVjsgXUOB4wzsW1lq6qm9SIQX9IyptcD2zTouEZyB0sKEUc=
X-Received: by 2002:a17:90a:440d:b0:2ac:4c0f:a34 with SMTP id
 s13-20020a17090a440d00b002ac4c0f0a34mr13158241pjg.2.1713884451644; Tue, 23
 Apr 2024 08:00:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240423-b4-dts_dxl_audio-v4-0-0c57eb7399a7@nxp.com> <20240423-b4-dts_dxl_audio-v4-3-0c57eb7399a7@nxp.com>
In-Reply-To: <20240423-b4-dts_dxl_audio-v4-3-0c57eb7399a7@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 23 Apr 2024 12:00:39 -0300
Message-ID: <CAOMZO5DkphPdrkQa8J0fE3=G5ia+hnSmy5W+=opCiShDiGaYyw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: imx8dxl-evk: add audio nodes
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 11:11=E2=80=AFAM Frank Li <Frank.Li@nxp.com> wrote:

> +       sound-wm8960-1 {
> +               compatible =3D "fsl,imx7d-evk-wm8960", "fsl,imx-audio-wm8=
960";

fsl,imx7d-evk-wm8960? Why not simply: compatible =3D "fsl,imx-audio-wm8960"=
;

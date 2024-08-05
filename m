Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80BF13634B
	for <imx@lists.linux.dev>; Mon,  5 Aug 2024 12:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722859776; cv=none; b=dNLSws3GjLgO6D1nTV0qphJhk7MUobdrzg4UvbSs7a+yiJZj+hjpYOLctC901w+g/Kt2HYxPNI+u9ITVttEJ815HQhTYMIGugYb1D6tYrl6k1nnANSy2o4ITe05qxmmYye5rtGWYh4Ay4v6X+A1dNvZxBy3g944Btb8Kf4kFGKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722859776; c=relaxed/simple;
	bh=ogmJyvZfxTS06hH32tvpvQqedGk3fvnc27s7vf6JNi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s51NJHBt4xFdpCy3ZlZu8GAz/caqF1mKVD0Zi3jgYc7QWRV1Ud6NjuD3vNqHdAP80mDVC/5NOlLOAogiKbUudweTdxSqKhJ/pJXKwroD+ed24S8qJ6W3RBrqEYAvPsJM60nfDJcGQfGjlTD+n3VLP9PsbpmM2EQ7W3bID+yQSkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iY13F5hu; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iY13F5hu"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ef298ff716so18442941fa.1
        for <imx@lists.linux.dev>; Mon, 05 Aug 2024 05:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722859773; x=1723464573; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQ7lo8YqKFEMphHR81LMQMxm/RrbZDOgGObtyKf2yQg=;
        b=iY13F5huSrUiJAkhysYhNDNBGjExAWciHWMcGpVb+3rQ78yk485fbJrIFKKpoBbb3Z
         cLVATetKj1ZMra6o6PUjMF98Nr3SAUCdFt4Q/rVsRqz2gYPy23JU4719ZOuEIY4ARp3E
         YiOITGPHSFcihFL7AwKO5tgy7fnrMj+aOufLrcacJFJTbc44GtHFsCEgfnDEwhi5sWQB
         o3z81tKU1xf37UCqwkQ03KBDfvi42yqF+uWC01SlskQxZRAAW6Su540sDqyRXTZIkuOp
         NS7sy0TbOuBz6Y4zw9HFTvGGkV11LW18qXMzZBJAYPaXKG259VyWItLSpaJy1APyWkug
         J71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722859773; x=1723464573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQ7lo8YqKFEMphHR81LMQMxm/RrbZDOgGObtyKf2yQg=;
        b=PZOcu5TR0s+8rHIu0B2pOQaRaGLCR1h17ZcPR4gp8lM3JmQoxl405clPzGZiD1Gltc
         mlbFaHWAzHozoVpEQ7Cr0vutTV03/9jx2mkP7bTsjpBimQdi+VAPyim+LdGIf8cYqOZ+
         2DnmyTPcmsVK/rTBfSeWONN2Lmxao391pmmRGMJz+ArML4a5TBuvbvOSvwi/SX4CZVWq
         vV1bUkCk65NIk6pv/wN+B35hQ9gyMigrikPMnxW1uXqn4mC1dLfdmx1ayu17Wm2reVFo
         xg5X2xfLb0nsrRvBmEs9rvkoMsvZwgmSAfFajc6lr6X99rRCyjTIdtgbLfw2ciwVqfDA
         83dA==
X-Forwarded-Encrypted: i=1; AJvYcCW12bVUECiXCLw9QxvOWv++ZAufpE2DXLCLT5WIn45JX0ugQjU8u/XhqfiGmGAr3o2/2Uo+8h2E5VmUMPObm9mUXvUE
X-Gm-Message-State: AOJu0YyN7zy/ifzr6l4F9MCVf63acr8r1WQWUi3D34Gx+vnMoSb2/tkU
	ebYKf1cJQnFJG6GnfJZBxENESF4rq0VptxcKkgY9hiGPGRO7SJuHSr0DIQCfCXaUZihuhY226J4
	Frfr4/Fc3r0FAszVri0mFVEruyhQ=
X-Google-Smtp-Source: AGHT+IHKQRB2DjDls5YqMHmNNIrRhBRmAg/WzIBHkG4d10FoiYze3cdrfQcwsmexvq1O9fFVw6vjs7v/P7nnuRyVTPY=
X-Received: by 2002:a05:6512:2811:b0:52c:ce28:82bf with SMTP id
 2adb3069b0e04-530bb3b0e3dmr4358798e87.5.1722859771204; Mon, 05 Aug 2024
 05:09:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240804220411.180264-1-aford173@gmail.com>
In-Reply-To: <20240804220411.180264-1-aford173@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 5 Aug 2024 09:09:19 -0300
Message-ID: <CAOMZO5DGB8LSvziHTCTEfM+hn2GOhhUA9juautRPibVK_a3qNg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mp-beacon: Enable DW HDMI Bridge
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Adam,

On Sun, Aug 4, 2024 at 7:04=E2=80=AFPM Adam Ford <aford173@gmail.com> wrote=
:

> +&hdmi_tx {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_hdmi>;
> +       status =3D "okay";
> +
> +       ports {
> +               port@1 {

@1 without reg =3D <1> causes dtc warnings.

Please fix it.

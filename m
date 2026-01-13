Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432053806D2
	for <imx@lists.linux.dev>; Tue, 13 Jan 2026 09:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768294813; cv=none; b=L9uzTPaFj1JT2yqXM9GtWCibQr38WN4lppKfrnzg0/fRbVk5oiyPfVYaNEMD5/h4VVNTlW1gC3a5ci1e+aB/1CsBCXxcNlSxjVoqLP7xo4iU3a5I+mhfl/kpfYUkZlB56bVdmZ6kFKgASLoPDUlBPD7vFCWtxOVPS5RpnNeGcoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768294813; c=relaxed/simple;
	bh=dBgh3Jpx9q0vMwoLAMjf7VGH77cU87wpAE8E4CagitA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d8TWb+9HodHIIEuvZLNPakanA0QX0LIyjYLHjV0tNxX2gyvDfaWeQ6Bp39oE/PJQfPBlT7Zplp5tWDBA7MNmnY92elkW6Rkd+OskXDauZjC/q3BP1ECMp0jUR24Sp+ZlgzaVDEtGG4G8oW6um4OA6LzKOlt4ulonDdjWVVX7Ayg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eaMvjPjM; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eaMvjPjM"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-121b251438eso3767625c88.0
        for <imx@lists.linux.dev>; Tue, 13 Jan 2026 01:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768294811; x=1768899611; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dBgh3Jpx9q0vMwoLAMjf7VGH77cU87wpAE8E4CagitA=;
        b=eaMvjPjMu6bnBP9rIBsvovre+4xlnlbrQC23ydotgv/jz1RFdgvZBhTaBTRrMK6/QH
         QZ1erwTshMNLE3PmGnamxUomHe3MyXHgCUdmYcTrggYnoUmdvf5zueHCmx0gAvWyOgXJ
         txFPySemg4j9WTfQmBAXcVKCFzdA2Uh5+sVfY4mtm/X0Kpa8hVVOUtM4iRxIMNMYefhS
         D2lkAQjolnZ+oLiT5BdHxzIwtP2PtZp3yHQzPJZLND+g9bQXV0bqiQBdRgDUyANM68Jv
         u8oohF9xpY7++vXNnTlSKq/uv14AvNjKiNc4RPa5g0xOKdd9dghVMQCbn2gNbPFxCXF5
         U7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768294811; x=1768899611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dBgh3Jpx9q0vMwoLAMjf7VGH77cU87wpAE8E4CagitA=;
        b=mSbneEDIH8Api+Xb4WHIXKXYZ11sZx5naqV+fwYmSB1YtDZphSJ6cvvQHp06mtOf6S
         fw4dqB7DJDkBZvjrYFDL62rGpi8cEcL99/dLtza0VE/8xmRFoOIhy4hZQ8p6OYahs81Y
         Rs9U0mwKttbZ9jrZh1vFtnhXJsgcUEU3zVxoZWqP36x5pJSK7HotjUZr49AvM2T1RebJ
         9ixTzs8Dna8HpVOKa/nxSZz77cVYFh8Ak5PuLSdfZ6o4cSpPfR1lVYGvCg+EJrzDe0lD
         22fpCEg58s3foPq89ngUujOGK/L4qIzYRFzeX0JiA+JyL6Jva3GJrZnqvLAAA2G5+TY9
         ap1A==
X-Forwarded-Encrypted: i=1; AJvYcCX6IhlM2q7fMBCZdwu6XOzSZ8jAzw0O+KtWAsR1b++7z6o0kQBa4YR/pnyOBvC9IC5jkWA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy98DZ47iXWqzWhZK5+m5lnCXGiMNCCCAsfEf/nGPoDNcGSEhaK
	I79pRURpC/HxusITlH7vofdWww8P3XWwLPOyTrB0EiaPuN69cKfHcXsx8U6TcRwW128+YIXjd7R
	wmfX1cgkdPb2G1iphG+MXVgNKKBFbQxU=
X-Gm-Gg: AY/fxX4pAPbz3oZQep6svwRot7UJtByVosPkYdQKktaexR5M7dEaYRt3/0orW7Qc0pr
	4xnN2YE2Z3jMmIByDg34nDlit8d6zAWHW9L5yv4Midbl+2kyU9iQ19ILDw3KxICH5Q2H3zP0PVt
	Aq5CczASHhsIfZoR8YJ9OWwhHGBJmsbn4zMeyiLaAQpL91tqqh3xO28oXWJ0EdxG8g5r+xrdL4w
	w3p4tZIgm+PyERkZpf6qNN7+u8dKCRpif1rZFBCZwUYP74ehJHq4qGFNqs2pMZHukm5J6jkKuG5
	u0pIxtzGpd8/2TDTxKOxeCVMSRgiU9QtE3Bf9K/8Y/upUoaQ7Ib+3xJtIe+LR0lL9JPcU0SrA8T
	eT8hZXci3PA==
X-Received: by 2002:a05:7022:419b:b0:11f:46b4:449f with SMTP id
 a92af1059eb24-1232b6425f5mr2643006c88.24.1768294810986; Tue, 13 Jan 2026
 01:00:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260111-imx952-dts-v2-v2-0-5773fa57e89e@nxp.com> <20260111-imx952-dts-v2-v2-7-5773fa57e89e@nxp.com>
In-Reply-To: <20260111-imx952-dts-v2-v2-7-5773fa57e89e@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 13 Jan 2026 11:02:38 +0200
X-Gm-Features: AZwV_QiS-vbZEBI1B5-7VHnaj5-2xQU7eh6G0NpgJs-gint5WBMU_wp9zkj0OrU
Message-ID: <CAEnQRZDODr2a3fvobXM7RWN_yo1mu5W+h6+tpbLho3QL=cQDuQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] arm64: dts: imx952-evk: Enable wdog3
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 11, 2026 at 2:45=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Enable wdog3 to allow System manager reset Linux.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

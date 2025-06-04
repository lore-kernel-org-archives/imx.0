Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D51B1DE3DB
	for <imx@lists.linux.dev>; Wed,  4 Jun 2025 16:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749055477; cv=none; b=at9V9mX5xMmCKimxDxqo+iSDZ8Glu0Zy1ShxECKkxskCqaYg7CbcPEL6MHF70JmMa9yR44LyACAnnwU8V0TRXo8dMTMiQSqMBj4wJU1o9GLH9idFPsGlfSJQplExhwzzGsT6qwufNkT+p7hnfEnLYixvYmXAY2zAPR/ib8FT3As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749055477; c=relaxed/simple;
	bh=wFMCMbJITuoovSp6CQHXf/DpRmcuSqQ1RVhHc0lV4rE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=szGbH43v4PUnG4/Rus8/InPJpxV4DNA6i/Tla9U9vUEgBs/cQYzElMscIdOKoIUEWu1txEC4LGYBa2SeiqIPROdi0QHQ6yQjxp1HHG/++XQAqVzYona05X+fFVyJXk2UrYLSSiE/14KNvvg73HHLXvFcxfIfDptTttnpyscWwoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mVfHAjqj; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mVfHAjqj"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5532a30ac41so14293e87.0
        for <imx@lists.linux.dev>; Wed, 04 Jun 2025 09:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749055474; x=1749660274; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFMCMbJITuoovSp6CQHXf/DpRmcuSqQ1RVhHc0lV4rE=;
        b=mVfHAjqj/DpAMnfnv2809YFale9mepzRKuFPJUW6oqk9+5nyvtthx1s0O/x2pFXgWI
         79lr/8kBhsWIbb4QYaYhdr1Qopw3q67xeqIXD7ZpIefk7oQgf98DmgFLXJSiUmv3yye4
         8jPQdqBf8QCHZzxsY/SgRYJ4oBYwFfGT+KGFQXORHkt6INu0c1jolvcRKIVoaXxnNZ6m
         EpG5vvxuVJx73DMup/9/8O20Dbi02x2QofI/xY7oHFp83AMDcGqC03g6qNbvsEH5pGvb
         L7Mzd/X0d07ORzenNM3beDJ/WzgHtsJddaw1BBmbR0jG8z1JMwTEIxY2IWl92D1CqJ9Z
         6EXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749055474; x=1749660274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wFMCMbJITuoovSp6CQHXf/DpRmcuSqQ1RVhHc0lV4rE=;
        b=nSe3842w3hoTECitQMKIvYefEIc+exoCiQFDDQ9CJMekdiAWjW6BWb2On8lBv00K8X
         ObrRmoPmJKbZFOayteO1LnZIeceSHAsrrRDi8R55IdNHeDyzHoU+YgzGWdNG1lNuWOE3
         evXzIjNex0B8ElMcOPNnCmaadb4A3IGITcSulQMTKFvm7Kn6KqCaf48eacPOLsVp5upZ
         vaUFPKqw3SHLO869iX9wutiWBk/WKNohJabvSVS2obMIQnSUyUJxHxDvdqJxkwbqQzTs
         gG+Q1GNIVHXYNRQyIfjqohhj1Eia00u/NKK5b9dU9XRIV6d7g1vjQoF/H+fU8W2Ss8y+
         Vd1g==
X-Forwarded-Encrypted: i=1; AJvYcCVOQqhdRzxU+Dc8h+IxhyILBR2fdJ7dLLJxRa12u4YocsfonjSuGUG2jLTq0Y+JV4CWows=@lists.linux.dev
X-Gm-Message-State: AOJu0YzwHT9GnezdZ8LbmotuAB6IGgU4PP6gCD5VPdHyzMlWvrM2VXrt
	9YCY0pU+KvxJJmc/LWTzvp36VQzqaqigDIOoXhce0OrU/shiI8EDqQ6VHfEXfNMrLWbDSmZ/prG
	ZJ/lylsa425YNbp/tlp0p7uBojLcg7LE=
X-Gm-Gg: ASbGnctmqcdxlFE5LOP01fnOsd0zSeFQmjLEoywMXQlxkk1/zVpPTZYDDOsktU8VLmY
	rxqRvADXDux9yzJrUVXAaj4g2BmjWNB9vweRvNmnoNokInJCKvUjhQ61JJEvhgVxZgxwdF+Usb8
	2vtgGcNOZ/9qDyaPVirDUpfl5lSBrs0A/ohiLtirsAjzYW5my7qd3Di03Rlb+lgarszObbLBTfQ
	sAqhrBmGoGPLg==
X-Google-Smtp-Source: AGHT+IF/YsIUFahxFoeFKA3DR2RVxvuZILJjjOA/b6Zn6AHVPsWFoSWcKKxSdkTyVWeKMDIAuj3FRHVXkASKTjwKFFY=
X-Received: by 2002:a05:6512:b86:b0:553:25b2:357d with SMTP id
 2adb3069b0e04-55357bd6f7fmr943933e87.52.1749055473351; Wed, 04 Jun 2025
 09:44:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250604153510.55689-1-stefano.radaelli21@gmail.com>
In-Reply-To: <20250604153510.55689-1-stefano.radaelli21@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 4 Jun 2025 13:44:22 -0300
X-Gm-Features: AX0GCFtSAkrZTNsALuZF7FxrEF2hbsck5XT79hM6Y37nNbT0k-G0Qzh3cVE1Gmw
Message-ID: <CAOMZO5BYBMq=5ir8WQBEH=h6SPpm4MiUrDoDJvJEH6ioUCB11g@mail.gmail.com>
Subject: Re: [v2] arm64: dts: freescale: imx93-var-som: update eqos support
 for MaxLinear PHY
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, othacehe@gnu.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefano,

Nitpik: The subject line of your path should be:

Subject: [PATCH v2] arm64: dts: ....

and not only

Subject: [v2] rm64: dts: ....

On Wed, Jun 4, 2025 at 12:36=E2=80=AFPM Stefano Radaelli
<stefano.radaelli21@gmail.com> wrote:
>
> Variscite has updated the Ethernet PHY on the VAR-SOM-MX93 from the
> Murata CYW43353 to the MaxLinear MXL86110, as documented in the

Murata CYW43353 is a Wifi chip, not an Ethernet PHY.

I think you meant:

"from the ADIN1300BCPZ to the MaxLinear MXL86110"

Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9171754B
	for <imx@lists.linux.dev>; Thu,  5 Sep 2024 14:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725547242; cv=none; b=fKSyxen23SxH6A2NjsJW0I9dgZrZaU2RW2MSGrSAzTXXG/yhsk7H2bP5A7lcG2NGXfdMNsfDMEzsfVKgrmzxT+qIBXnMXkLjequXs3yFaA3SZ1A9zPSUvRXlA4OsTSq5Nwn71LYrGzD+w5Kr10SGN0JNNRr4909Oj2LhDvHr6ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725547242; c=relaxed/simple;
	bh=BDdDoZl4AHdunDtnZ1j+D0WS6pyG58ZQ5yjOKLfNmFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BNskmOb/VsSHpST1jiK3QPJFah812Y/Bzowpy6rUKe5uDMJv2nobtM/HvtE+4zb3mlEB6e2jEkxmGc2rzlN/+lQ2nqORA2Q6GDWESBQBmv0TzX/GbBEBPsbJzfX1f39uhry+AZNhJ09TPxeyWITcj3JZ7TzbNKWFTqc3XZ+LJ78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ov9xINbW; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ov9xINbW"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5343617fdddso1341417e87.0
        for <imx@lists.linux.dev>; Thu, 05 Sep 2024 07:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725547239; x=1726152039; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDdDoZl4AHdunDtnZ1j+D0WS6pyG58ZQ5yjOKLfNmFM=;
        b=Ov9xINbWLzS4c4XGVmF6vroZG5y7Q66t2fQrEWCQjIlvLh5WX7B1raDSZJzhjvBk1R
         wo191PP/hzLnv08IuwSpqTXj5jOdhQ69qAx+OprPhQId1s17FVV99m59nAeD3cb0NMKO
         MDrTtlsE2G7neyOH49nZbw3lnde4ypemxLEeTPJCq28k8uNVESSfTNpgodbz7rd7VDPP
         XeHy7VUS7cdYOFh4jJsGxldBUD8M1nqgXb/zdzhbG0cHJPrSmkB/IpxYpH9DhveRUnCh
         xaykFE3S5lE7lZ1m9SxtD0UQmwQIQF9G7/QcRL49NHovcFfAQbqF7ji4LvKLv2+EXTGM
         yeQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725547239; x=1726152039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BDdDoZl4AHdunDtnZ1j+D0WS6pyG58ZQ5yjOKLfNmFM=;
        b=KvdgrrsoOkumpohiiYfkTdiCcTAflyZDvItRO/sRUkeoCLyFW1nzvk4O4Mkd+mzMTF
         I8amvd5scQ13OC7XAatwqbOINWqi4m+iZNbQNkR7nwJDaMut6IWMiNBFmoKMskwDJLcQ
         Uc+BlTB5CDYPOpJ6DWeP86846pglgdkmmM4z/Fa0mhHmiI+H4ore+IxAuHw2+Z47HEGC
         pvU7qPqHMua8PUFeBom+enrL/qOGppY4gDRmFGTZMonhSgWvC/KemoJ8AwsYKh7w9Lez
         NrKI5Mk0Yi9yV6UI3QHT/+93pkENM6AHSeGXNPkpRcFeK4qaelS8gtoSqM3l+EiUgjm2
         bdmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMKQoMgFWh7zOJFRPM1d1vB1b6ijjHLVGm9KgM6Zi8FaUIJqM4iZ6oX9YhxrDYQtJNIHI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxmTP4eH4iF109Ygt5a5TcGe2IDQhpqRP716chau+HBwCOVpOEz
	la0NWWN+vS7yrrbTFG4qcg+wn5cCnVPMMtlFescoV7EbG+DQk9sdjJGOjq20S/uL1E5Ag9V5ePh
	Fckw9m/B3GPhzkbyquZAOGDvP7S/SwHjX
X-Google-Smtp-Source: AGHT+IGrlm2ln9ylu1HuPn482cMUOC7w/cXA84XslGGRasYCJjl4YVv0SyNzYmSygy8l9Glkzk7qlAzd4V/Al6Upcng=
X-Received: by 2002:a05:6512:6c4:b0:536:555d:11ed with SMTP id
 2adb3069b0e04-536555d129cmr743361e87.12.1725547238248; Thu, 05 Sep 2024
 07:40:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240830085441.3589713-1-lukma@denx.de> <20240905143645.7946fb0e@wsk>
In-Reply-To: <20240905143645.7946fb0e@wsk>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 5 Sep 2024 11:40:26 -0300
Message-ID: <CAOMZO5D3y1_-_TX_a7zuYPxdRKGHGN7JFwWMNe_dtS6i0Rx2jw@mail.gmail.com>
Subject: Re: [PATCH v3] dts: nxp: mxs: Add descriptions for imx287 based
 btt3-[012] devices
To: Lukasz Majewski <lukma@denx.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lukasz,

On Thu, Sep 5, 2024 at 9:36=E2=80=AFAM Lukasz Majewski <lukma@denx.de> wrot=
e:

> Fabio, do you have more comments for this patch set?

The new boards compatible strings must be documented in
Documentation/devicetree/bindings/arm/fsl.yaml.
Otherwise, many warnings as shown as per Rob's bot email.

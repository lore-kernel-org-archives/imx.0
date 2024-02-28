Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644115E07B
	for <imx@lists.linux.dev>; Wed, 28 Feb 2024 20:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709150743; cv=none; b=NbCJuo/x5gGKIQC37KSna4+1WTKgLUluh7DquMdBLVroHqNxjrtppRmPlNqd7MF9oU2mq/6t/VWZQ4cXv3mbr2fCKWHSeJfEFlgcbndqFGl7waVc+NSav0BR07jzqQKV10O5hFyAFR3zhcNzTJdGA0R+O35Uo5+X6SdJ4F+vLtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709150743; c=relaxed/simple;
	bh=JyzblYRLS8E8XE3eC8RA0bLn5Z5XB1jUOsQNmooG598=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bfJHV4mKHxWm9Ho4mLWzNhdVllnvH1GKVXeGG3R0kPV94RVPIteqHXyJ/jGyjsvm3ktMHtviZ+z7mWluhPGA81buuYM6qzqOT4lIrRWFLxgAR5jHshgQZe37ir3eYyT3BZbsNi6sxpOVKd+RxJ1zZMHEtm8ppOKj+hLqP+7A7a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GcveFm27; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GcveFm27"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1db9cb6dcb5so380065ad.1
        for <imx@lists.linux.dev>; Wed, 28 Feb 2024 12:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709150742; x=1709755542; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JyzblYRLS8E8XE3eC8RA0bLn5Z5XB1jUOsQNmooG598=;
        b=GcveFm272w2vGTx8AqTyOAB6rdlvTbw14pLGqs7NcDma4IyW8XIjpd6N/YIYOThLe5
         0XN2FdG2Fk3gwzubsRlZd3S3I3XH3nJfYi+ei/6bm9SVBN2SNJautu4ZEW8Zos004zh5
         Oqk6dhFNoU3fxplOfpyT/eWLoygSqVMMMbpSANzHcTp43ZPELEU6TjMgNnaSWquuAJFD
         LinOYoY1CqyEYoRoTEuD0hx8Fr6skNb3i1L8cUl8ZKtyiRmvV0KxbO4RUzQIVxBrLPZR
         83fCi5K/x+vK0jc6FEYhu15Jnmh5VYT5z7rHbVFzx5hCuE2UB4unt2X80oCPnFaF1MzO
         rGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709150742; x=1709755542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JyzblYRLS8E8XE3eC8RA0bLn5Z5XB1jUOsQNmooG598=;
        b=tdy6+PDOlrKaULvGaBh4Flm50UNjNtsxfQD67k+8qewWenOBrp7dD1gsXesclALDI1
         pR92cUa7xbGmfq6tcL5pXEbs0C2rk4f9Opdla1RrufP9rAcrkWcvIr+2J1Os5dVump6e
         3hq8xlCOwpL9JljSDBSqiNeLNz4wr9gnlrQjJ144Yn22EOck/1+j2ddVWDvWHXhlBhZC
         hvVwT05a97rbMEfndGfKJtug+JRc5wpwfDESKrpJ+hA19h6yUfS3OxzqJMPpcVBZWJ+q
         InBCj2jzM//iSup74fUNkNKsbQpEeummxjqf8RMj74vGFM14xFrKRKQqwUG+0MSnvExv
         no2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUNefGpjwzdg7Lhrv17YEJDIIMnZeu7bbd8Le4FplSdg+lgab3ap2WAPHCF3xVpjULmn11137GukgyNurx2aDnf5GCU
X-Gm-Message-State: AOJu0YxxyC1HIRbTdnn0DM0D5H6Vh/kEcREONScQwijAEVGAO8HloVpI
	AMAup7RyzCGZbFTJ9WDMv0+aXUQ/zRs7fchWPIyg2AwzUNMOJvwdGS/BeoJ2r+m+/0/tTX0Q6Xc
	fb345nGblZHeD7/Xf7L4yzPgwlAw=
X-Google-Smtp-Source: AGHT+IHsZRLMml+PbJzbAC5hyexFcCLbAN6MYAcVHavIcmX4gHOzbuOqL2mhWHFmJXyDbJ0yPEVtzoItViR3sAG6KG4=
X-Received: by 2002:a17:90a:7565:b0:299:3748:4ada with SMTP id
 q92-20020a17090a756500b0029937484adamr228138pjk.1.1709150741772; Wed, 28 Feb
 2024 12:05:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240228-m4_lpuart-v1-0-9e6947be15e7@nxp.com> <20240228-m4_lpuart-v1-2-9e6947be15e7@nxp.com>
In-Reply-To: <20240228-m4_lpuart-v1-2-9e6947be15e7@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 28 Feb 2024 17:05:29 -0300
Message-ID: <CAOMZO5CiO6jhyHv88xySn+rFEqeYbdcGjN_KTQkOApy0H6efnQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: imx8dxl: add lpuart device in cm40 subsystem
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Alice Guo <alice.guo@nxp.com>, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 4:55=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> From: Alice Guo <alice.guo@nxp.com>
>
> Adding lpuart device in cm40 subsystem.

Don't start a commit log with "Adding". Use "Add" instead.

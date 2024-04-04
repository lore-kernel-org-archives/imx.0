Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C3B80C09
	for <imx@lists.linux.dev>; Thu,  4 Apr 2024 11:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712228606; cv=none; b=Hq3W7c3pNy6ehoyZlCdO+JJbNbh1pUEaa2r4pEE1Mdty3Xpo7LgaF6UBcmNe4RfUhT+FwwBu8M3E/KAi/h+IKG36g2gW7NcDav7dloLup1irQ9E+//wlYSNx9MHarpNiOkMh5mPwqq20PqynrJ6KJEylNF+L4ll+8IPgOawDj9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712228606; c=relaxed/simple;
	bh=+hAeU74QQfbsZOvQyLbhO6tKobZra3FmBs+/7VBvJaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EncSGdVUnlGmIUEGbO2rHKdPiUbBle/CuMCpiQS+9bxRHz3m2d/xx+tf4RrBcV0RECtM8Ey8Zmm/zUry7qW3kEbrYeQw4dBw/Yc6Gy0SWqhMgE7zSIkxX7of5J7hCTbIM6Nj0mpMV9Y6ggw1qssp0O6lUvptFpH3ZLzrhktL5K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lAK4F3NL; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lAK4F3NL"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6e694337fffso204136b3a.1
        for <imx@lists.linux.dev>; Thu, 04 Apr 2024 04:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712228605; x=1712833405; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+hAeU74QQfbsZOvQyLbhO6tKobZra3FmBs+/7VBvJaE=;
        b=lAK4F3NL3rSdrX+sFyGJfjUZCbkiFwTAWBMPFey2RGlvnP1bR1MV0QO1EfvqG6BiuO
         U4fOmZw4xM/Tw6fNgFCb3+FDLbM2weOvocyRnkXp8AQvR+oa+jNwoZQLBDNiUOm9u+nr
         IiXzx0gzmpImWJpcS7368HS5cfv3ak8uMQjqIcYT0vbAlC9ZREwA2YbTCp8zn/CC6uaP
         kQqj/GaBM1QxRlEc+IHvIk24eJGLFwzT7KLW2Yc39OFIVFaEQ46OLUD6H3m7YPBltPCU
         q950Z4ihIcsstu0Fqo0NH35PwzJlblLODB4tuR41y0xZts7hCRoCZ9yd5U8aztuEb35a
         cNrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712228605; x=1712833405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+hAeU74QQfbsZOvQyLbhO6tKobZra3FmBs+/7VBvJaE=;
        b=S0PgQJT/Slkx8JTVAJIuNRqNUB6LWszbChSdEq9cCpW7f6IWQhPTpp9RYqCpT2+bXw
         m8aqlEVx0LzWzXY9fRHGirh7evNF4+yo//mKslSDbLIPq7YxcguYIxvZnVKR2z+ZwZF+
         iFmjVtYJqvb77Rl2TcoPa2v9hPuZ9TBZMyFaQnLtWInZMG/3Rvgl9VADZP494E3cIpAz
         CS3yPYN6QBiqjxYVBqfNxCJL2ZB4OECKgm089BP6PHW3520ZmyQ2WIxMFSMRXlI7yb6c
         1jFauJlYqc8tjVLtknQMxa2K0aYM5Y8A4csMjkaXzJA73CNbaHjL8tTh6CS2cs3fM2Pz
         +dEQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6pZ+12Aq2KJIB634FLhvt51uYL0BHfPcfUc0y3Qv6rEQFSHvaKkZFT/uOAb/Wbnhv8yrAUAfSbeMBTwwSfnfY42V7
X-Gm-Message-State: AOJu0YyKb049aEOHZyJcptjXoSCRUOEH0muNejV4Uu9Msa+UbMI3wy2L
	FWvZUDzfUegQQT+S4eLOgvOk0RoinIN+XhiTDn+Oga1t+9YW7neNxmM4acJw4nJFLnWVEq/Ju5I
	oCLCaPQ8O6A5HDoveViYiSXoTkZ0=
X-Google-Smtp-Source: AGHT+IEiV3mYP5jcL1qYae16r/KN6hqKughbDlZ4LxlcHlZBBb1xETAo6BgRMuLOSJwR/Fy2iLftYZBAuG/Ww1JZaBM=
X-Received: by 2002:a05:6a21:6d88:b0:1a7:199:8ac5 with SMTP id
 wl8-20020a056a216d8800b001a701998ac5mr2303003pzb.4.1712228604634; Thu, 04 Apr
 2024 04:03:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240404035205.59492-1-Frank.Li@nxp.com> <af602862-5120-4717-adb6-694ada09e8d8@linaro.org>
 <f5fa1872-0bae-4f04-aa94-27db937516e9@linaro.org>
In-Reply-To: <f5fa1872-0bae-4f04-aa94-27db937516e9@linaro.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 4 Apr 2024 08:03:12 -0300
Message-ID: <CAOMZO5Dtd_p02YeX6tcWMGzujZ-GwLQMQBPBOx9xLmEgs6VVNg@mail.gmail.com>
Subject: Re: [PATCH 1/1] dt-bindings: media: imx-jpeg: add clocks,clock-names,slot
 to fix warning
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Frank Li <Frank.Li@nxp.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, 
	"open list:NXP i.MX 8QXP/8QM JPEG V4L2 DRIVER" <imx@lists.linux.dev>, 
	"open list:NXP i.MX 8QXP/8QM JPEG V4L2 DRIVER" <linux-media@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 4, 2024 at 3:54=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> And for the clocks, instead pick up this patch:
> https://lore.kernel.org/all/20230721111020.1234278-3-alexander.stein@ew.t=
q-group.com/

Or maybe this one:
https://lore.kernel.org/linux-devicetree/DB9PR04MB923493D0DA82C9EC4386BC2A8=
FF1A@DB9PR04MB9234.eurprd04.prod.outlook.com/

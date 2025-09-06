Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5112472AE
	for <imx@lists.linux.dev>; Sat,  6 Sep 2025 16:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757175616; cv=none; b=NDRf90VD00h0qZazyi3IAghaddJxKrXttiBU/Pj43DltrQOdHDPjrSPSt8AmqbyieWyhKUs0HB5lFqxYuAmFU+YrA05TnGAvDUcuwqH8+ipl9mtp0HcCDN8/ki52zSa6Uo3qKB8oD0KW1hKqRsxrM/T/z5CNo90+gG5xQykt/G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757175616; c=relaxed/simple;
	bh=Bn/jHYQx200PUbSrc1Z66yZsA5qTF4RnElG8e9gDuFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kYG+PdF4YoGbHwfCJNoTHJdsL/6rjTJhNHvuOonH4p+ba8zLo8QzZh60aC6zW63dgIBPLlvp6tAq8H7YWvt6oO+3VLx1iOvhIiBz9m/ipVA1MuecK0u/gdZ3//h7/9pG+4dynK1FIi4xKT4sO6lAlVvRaAdmfcSLaNu/i3t0MjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eyi4Frcg; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eyi4Frcg"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b47475cf8ecso2043501a12.0
        for <imx@lists.linux.dev>; Sat, 06 Sep 2025 09:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757175613; x=1757780413; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qlAicO4VJuwjpI/abeEihOqBcsHKjK5GHV5eGSORL6E=;
        b=eyi4FrcgHqTnWKykD+B3SDR0TjHm7DbajN2yZc7x4dzMhIuBdVQzQCSrcvTAtICyaB
         nW/stI7+b4pGVOdGnDE5Te862Awi6F5fHG1S+nwOWctyIQWElVEmLBEXGOCEpGx/a9g+
         1GzCecmHY/bqQXT+CxMjD1xw1kqDOPdECZ+c8FAf048qq+5uLyWIULgAlVJBByJ0QZiz
         ohpPwLUaehLTEsmaaqMq77OTfdRF6Ygv9hENuleTrPcUc2nRnYslck2z0vvSVida6vw0
         CJDY3VFYWIxdntWSpT1417kevwLqSY7SU9Md9cSn9aIp8O+VzYF/MxiH6VVdA2oXKdga
         ABcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757175613; x=1757780413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlAicO4VJuwjpI/abeEihOqBcsHKjK5GHV5eGSORL6E=;
        b=dYK3e61gbK3DMV9KBCDn98BfK0QMQDB7CsL7OL4DC4TJoPbsK1Ugr/T4IXPNSIsruZ
         dvGiVQMv2zzB3NMPEIX8c3ojIw1PYhnZz7s68koFtJEr57M8zGL5l1Dkx+6B4UpqAiDl
         IXnu1ldq0bEnd+Y5rVPT+2AX1oX+rvAaLVNf8DaeovIVUtkLXiRYy+Y3iEYp3R3ZIfV5
         LzrbOjLn1KtSwCKNHtNQ6GuTKhYRrw4Sl/do/wBPPES3x+kWS1C/ew0TS8WF3A/dbrSS
         OUxi+aXELnI42/XlTEuwlSBrGkYwFGWpCaxxSREe8WnxUGLcsbDn/mpEU5daVuyrHTCv
         NiCA==
X-Forwarded-Encrypted: i=1; AJvYcCUwGy5QOqp1M1251AopYiAA3gWgR/HPOsSt2l/D24mC6Xt69dqPWSzQ4dkz+QYmEFfz7jQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwjT4j+URbRX9j5mZ44pCXuN+Osj5y2yPG0kIt/crsH2MFvD80A
	76pPGnGxPVEJ0BVuhYmZUvUP+8kgW+vOE9s5HRHMPHyuRBE9f9JnfUTC
X-Gm-Gg: ASbGncsXLgsRDjYk29ofnYXlOzxBfWBS/DOQC2YpGsgvJBt3FyoTDvcx6G1nGJgviDD
	llEP2bzOBeJ9pcs2H4zjdLoGGlgD79ivpGzn6Vp9rWgWucoAkPTlwL9LOjqMd+DWWzEQPfspo2H
	LF8BeySPdI7QNlpIJFkoHC/aq7xKVdmjRgX5k7zQCMSCOA0avBGSkcYf5ZUivIsHgSgNF6CFek5
	ma2k9kAa2iQQapCBFNrP5BN9Ttrx3khOe7NbGE5ECsUsLDI6v0ajX26LeBSqZNofKUCwUv2D9mP
	EMMyppbz5lKF/sDNCsqCBIR+LWacb7M9YDNYDT3MAUGZMMI2wd61O/MigrYuD0QF1b2mlfMwmh8
	KWE/NDnFUq0emgtwqNmK+xPo=
X-Google-Smtp-Source: AGHT+IEswQp2znCUxy3aqeMwXMObMkOU3eyuAOWo7d7qI92Dc7qQl74XXiqhutZY570cVte/uEI5FA==
X-Received: by 2002:a05:6a20:6a20:b0:243:a4de:d7f with SMTP id adf61e73a8af0-2533d6059a9mr3442665637.11.1757175612868;
        Sat, 06 Sep 2025 09:20:12 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:e08d:5959:e7ec:1beb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd006dd49sm22515784a12.5.2025.09.06.09.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 09:20:12 -0700 (PDT)
Date: Sat, 6 Sep 2025 09:20:09 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: input: exc3000: move eeti,egalax_ts
 from egalax-ts.txt to eeti,exc3000.yaml
Message-ID: <ux4t56t2ec2gejy7hr2dpht6f7acda3gkm3edfshk75idgpzmd@g7d3bvrtxppk>
References: <20250904171543.517650-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904171543.517650-1-Frank.Li@nxp.com>

On Thu, Sep 04, 2025 at 01:15:41PM -0400, Frank Li wrote:
> Remove legacy binding egalax-ts.txt file. And add compatible string
> eeti,egalax_ts and wakeup-gpios to eeti,exc3000.yaml. "eeti,egalax_ts" is
> general compatible string, which is not preferred. But it is compatible
> with old devices (older than 10 years) and existing driver in
> drivers/input/touchscreen/egalax_ts.c.
> 
> Allow address 0x4 for eeti,egalax_ts.
> 
> Don't require touchscreen-size-x(y) for eeti,egalax_ts.
> 
> Keep the same restriction for existing compatible string.
> 
> Fix below DTB_CHECKS warnings:
> arch/arm/boot/dts/nxp/imx/imx6dl-gw52xx.dtb: /soc/bus@2100000/i2c@21a8000/egalax_ts@4: failed to match any schema with compatible: ['eeti,egalax_ts']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thank you.

-- 
Dmitry

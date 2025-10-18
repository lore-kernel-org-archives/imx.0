Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8448A2512DE
	for <imx@lists.linux.dev>; Sat, 18 Oct 2025 04:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760761369; cv=none; b=pMAc63XP9i4RElKmfAfaeq9IBSoraw0dpkoJ6Bf0wz4OR92MNMa9cng+Y+YE4b8ZdNzpcm4NZF048oBlUwke1o8ei+q+HfPF5SyriZD+OBaV1LL5QdXQdhOu/6KG2i3RGAP5DcbcrKil3CM+oFt5xFaHzxb1uvX6UR7oE922iyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760761369; c=relaxed/simple;
	bh=exZpVuWOIBxlqb5BFOJUqBQoP1y1IaWov30sQCj+Y2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VyLjqvi4erqaYp+Mar0LbqFNqSw/KkO2bASECEv99rFz5VonMSXJ3QMa92uHYVihOL5HLzGuzJmDBoMo3JLyRWbJTJpGI2s5BZpmpFNwI2LOWx74yQ9SVYO64XSq2oQA/W1pDMnwWiJmlCi6llWZpZuVmAq5G71JFrCNA+NOJiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z1RM6y52; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z1RM6y52"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b58445361e8so2845514a12.0
        for <imx@lists.linux.dev>; Fri, 17 Oct 2025 21:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760761366; x=1761366166; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uZFnDDXwZoBpjbUJskJ8yzMDCPN1YwW/10NX6AdoJr4=;
        b=Z1RM6y52wotiWBNe1W9PYbYl7QmjSOcTVQj530MNPuN2VdRqL/ghl/Ty2GVY9gkq04
         hp4fLRdt4BLrTGo78pQ3Ykh6646oBnBE2737mq+mbnLsjFFqTo8YSXJNf9NzbGePNubN
         wp280dGp7gY5prjV88VJ4Yx4nsfg95Lcj/5eUviky8Z5Z2C2ubLpFkrnGL62F1CRKQ48
         A31sOU0MztZvfcifG0oFDFK7Cr+2Rko99MEz4Hm5zohssXNrZ+gbG18aAVBjt/Of47nx
         6zy7VOz8vidDLPvB/G3Zalc4p/ofQIu1ogQiDxT2xDnOTQQ9+KspHTP7tiyYWQVb3d0I
         cf5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760761366; x=1761366166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZFnDDXwZoBpjbUJskJ8yzMDCPN1YwW/10NX6AdoJr4=;
        b=dRyux4rsaFrN9RSb5LzcopN8KNfftmYUnEin7mpG9qW/t1GtQAMY1KZPz0oajhWlW7
         MjzvFTpgdcPnjYZonRGNpwh2N5Jzo/mVkJvJfni7OJq5qer/A6nqQTqciM1pYtnkwuO3
         44i4HpOqt0DhOKWJYP10g4SQZTbtC88XJtTvySDJvU8gOMyS7ZyYwJTjQeXBm87hUFng
         /jTQHe0PYIcnRUCjmPCEinnqyExkri5hZVP+J0TlhneM+nnnFLTeaRnrk5neguFOP9Tc
         5UF/XG1GS0W6sRYbPoV4O68HoJ5QxnUnnvt2G1u4U+fzFXqsRG4lVhJwCduEiQx5y3TJ
         e++w==
X-Forwarded-Encrypted: i=1; AJvYcCUrl2/qTdiUoWCew6FrCBXrT+i7IAifmCLX+/rzac1uzSEJpGyE1zR900F7sN7ncmJNXVk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwrVJeL/QkHxcPOI0pDuKKHTA8DkINeQT2okx8sOM7h+NCIcAV8
	qSYM5u0O3qqMoWZrtj67nrTgtIoIdS7oUC0yv2WnxZqDy//s4gKnwST2
X-Gm-Gg: ASbGnct4t7xdOPosSA+dGqEq0OYi0gfnoVROubqByqs2EoyY+3ZYy2N7PU0TYNM6RoK
	XxBYMOQdOV9UDUOD4n6GYbb/ss0O8Fr5f1Q2ETG3dzvuegBCtY3H6GxUz119xASHmFhh73vV+ws
	DObG1HrBvaip5hsMz341C21uCWfm8eBw1lX4grpintXVEwiI+XbDl+s1ZD+tT6VgdE/QcIsxfTM
	L4NH9FQM0KTFrQaBFVjZhq6A4qFtSLM0hKSjnqNEeX7Txmr3M4DwhAOKAG75bR0RaF7uxljOLHe
	3Y+2a1owIdzugFrLur9Kzu16C0igxPM556XxORIzuyueW4EhTYkv2K+CUDFzwZloiw89z01jrNp
	7Pjvv/hvdEY49A+og3hbb7a0sWLZ1sb8mmwM7kjbRLiHE7lRfyUnNvKh0SAJ85VErJ59vmeGqa6
	23fQ6d4j916CJluyQNjltUV5LlgcCKhPU6n9JYAtee
X-Google-Smtp-Source: AGHT+IE2+OLcWPAcD+e3Cof7+/cYK6cBgEAdvfBAMWtRu6sBlIeGSM3216zL5aw1nuX6hNOb13kO2g==
X-Received: by 2002:a17:903:234d:b0:267:44e6:11d6 with SMTP id d9443c01a7336-290c66d9d55mr75380665ad.6.1760761365765;
        Fri, 17 Oct 2025 21:22:45 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:5e2d:c6df:afce:809b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471d5c0bsm11885895ad.69.2025.10.17.21.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 21:22:45 -0700 (PDT)
Date: Fri, 17 Oct 2025 21:22:42 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/2] dt-bindings: touchscreen: rename
 maxim,max11801.yaml to trivial-touch.yaml
Message-ID: <syo4wuohnpfcinq2pxxif5yig45k6pszdhmu4fgxrkg6q4xn7g@dyfy7k3wfhg7>
References: <20250926184720.391335-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926184720.391335-1-Frank.Li@nxp.com>

On Fri, Sep 26, 2025 at 02:47:11PM -0400, Frank Li wrote:
> Rename maxim,max11801.yaml to trivial-touch.yaml for simple i2c touch
> controller with one interrupt and common touch properties.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thank you.

-- 
Dmitry

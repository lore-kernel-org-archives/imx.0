Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F853803F2
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 15:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769095539; cv=none; b=beUjBs9Ni2e2sW8+Ckay6yA1ge9gjYOGlIfVyXIvJ0YiiVRXkJ+b5U3Qod9//wHlhkjgDwP7twWnr1/FZanYoEma03F8bqmofVsNZ0/NvtSgPMsdWxSHcuNkWSX62ScrMBlp7C/DQiRIO2+JOzeyZM13fC03GjWY6g8o+UHP0zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769095539; c=relaxed/simple;
	bh=pgNiofgJLQjI2k4U5MZqlxSIxjaIGbb5I0Xm0TFUekM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQTgNo7Oh1LxtG2UAxIwES5mBsEGBT30f4WjW/IdOnmXRhaeHUmYfzrB0X/mEslv0Yg3IL7WvpH+6fSbTtFnEYuJsykj2PJMu28prmZTCpAbQc4DV5Lvy5/sQSf0NglU3hLD1RuyJu1MFyl5+PTxcc4FLTQ1YPNMr9SvrXAeYQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7MNE26z; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7MNE26z"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2b71557299dso1488431eec.1
        for <imx@lists.linux.dev>; Thu, 22 Jan 2026 07:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769095532; x=1769700332; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fK/Bd6ZC4I2BWi9zAGM5OINFSwJZAF+Q/z/0mdibPSw=;
        b=d7MNE26zmHozsuFxUrjAUnkxZv4W4pLzAu+8UyLbaxFGiaUEoGLueYZxh0Ak07D7nV
         0KNdippjC/0HQPRWfxWx8s3T8sjChIrrAMxstwOU1moGJH/ZgbLCjA9ba64D/cSrcbAy
         9yq1yKLk6ZtekvR8IwDCe7NUppHKonmwYDhaCnzCHpL4qL7nTeW6GmLp6B2youGSAm75
         qEMCzZReUK2CNLG3ZsVwjCm+SalBpbhwlnFByANxjglWtAOVV0YRaaa4mg5Z07FVYCsR
         aqbDlFdgm4/KsyrmLDZKGr7YM3FA6QoantMYdRGu4FvYlRzTOmTtuQx86L8bdTk/KiBf
         wtYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769095532; x=1769700332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fK/Bd6ZC4I2BWi9zAGM5OINFSwJZAF+Q/z/0mdibPSw=;
        b=GEuWLVHZAdgyC1LXGV+HOS/wxgTqjGdHE2W5B0JYzxvr/yNYnEsc/iepwqHVCGjlFT
         1hhbnswYAs+9LhaWH/I4TKg0fLfI31/JsjkdZIMm6oKOQ/CjzkQrIaQPBPd8Ss8IOuv0
         iZNM9/x5Dr1ZezQ8kiXxWrEIt0ub+rItlAkvg+T9xysZmReWizL65nOo3vW+abwZYA25
         DNn0O/4XdNPwGaPsLSyFNCjBSieCiccpA3jvtVqd4XpgCdAuWLBBwWGhlgc/u77QK6fM
         SpDVKxHRrpG6gE0MB/Y9O6g3RkeWGgffUqC3e9adG9v+h3mYFYHxRwJcGFe3imotHjV2
         BtzA==
X-Forwarded-Encrypted: i=1; AJvYcCV0OEYiQn7hQf38Y5JfTNx5i4Swhrc5ILK2BukSLsFB9FjURQLgYxjmUyLc7CU/Z8RFa9Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YzvjjBWYIr7Oam4Q+S6/M3qKc4+IdFYDZzwEz83oK90g2ILJAHp
	9Nz9+bskZc79q66wvwqKcFW2i0UAasdMwmFYZLcFsLn4wRkG+aFft+ro
X-Gm-Gg: AZuq6aJJcO7tYv6cXVVex9mJTyXIOTIuPq/1J1r3PG5aK2y48+qESIx9ij5MK7y3RKN
	FIgAguaS4N7Fp86xgcZ9u5Z4c8pxzD1a+5NZ9hqvepfmQ/ZeUdQkq1MUEMsQh8uo4uFoqIl3ozh
	Xv9z0CehWsVnWTwsj9TJ8vVJ34RVW0IqKJtqmQ5no2wUaD47odOQmbbBbI9L000ta74YCn4iz+n
	HgQeGdFA8fsmWg67jLdSzI5pM1HYpHLMVjkmHBDPJOow1GhCwEjXWYuFFODXAQ/LbYICcGSM5nn
	mLcuzmQozRzaAb+PV5uZRCmNGWpUeiHgCv1ZxMh7X1KzIHcf3e1syUT7CTAy/nNjR7S7ZAuljeW
	1zwuxhJ+CKAJKSsjhcX0hyIV+L1cHoB86VTXjEkiQT7+MzJl/Bf0PNInIAG3GwTYE8kYMhb1P0y
	1ukGXesPxkaHE9RFiwkxi0laGKdDcdND/uh3DtqS03s+ljzLjI8vM=
X-Received: by 2002:a05:7301:9e43:b0:2b0:4c5f:c05c with SMTP id 5a478bee46e88-2b6b46c691cmr14222927eec.4.1769095531525;
        Thu, 22 Jan 2026 07:25:31 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:777f:716:9c18:5588])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7070eeec2sm9198224eec.21.2026.01.22.07.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:25:30 -0800 (PST)
Date: Thu, 22 Jan 2026 07:25:27 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Samuel Kayode <samkay014@gmail.com>
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>, imx@lists.linux.dev, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] Input: pf1550 - Remove "defined but unused" warning
Message-ID: <qrtwktjjxjphuan2brtltc54p7j5hryl62hghwyjmloujpwonz@eckisacyhd73>
References: <20251210211149.543928-1-vaibhavgupta40@gmail.com>
 <wfdhjzhkggp26mwqgvxuanuzjq6v2g4pmc44jz6kx4xwkewwhr@movikefnuvcz>
 <aXIhp_c0zjS9dfWQ@sam-fedora>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXIhp_c0zjS9dfWQ@sam-fedora>

On Thu, Jan 22, 2026 at 08:09:59AM -0500, Samuel Kayode wrote:
> On Sat, Dec 13, 2025 at 01:38:57AM -0800, Dmitry Torokhov wrote:
> > On Wed, Dec 10, 2025 at 09:11:41PM +0000, Vaibhav Gupta wrote:
> > > If 'CONFIG_PM_SLEEP' is not set, compiler throws warning for *suspend() and
> > > *resume() function for this driver. Using new 'DEFINE_SIMPLE_DEV_PM_OPS'
> > > fixes it.
> > > 
> > > Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> > 
> > Applied, thank you.
> > 
> I think this patch was dropped.

I see it in my 'next' branch so it should be in linux-next.

Thanks.

-- 
Dmitry

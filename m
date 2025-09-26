Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6417F6ADD
	for <imx@lists.linux.dev>; Fri, 26 Sep 2025 01:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758849705; cv=none; b=msxr1ikNvHfFwVmGrjr29NtKZjKu2M8DJXkKq64BlUOyuc7ufzxC+3QrnAkCCN7h1I7E9byBwoyo5lpVCgD+n7GkSlV7hLEF/lNxE9Ld2i9lWFxY+u/nDKpMzwhCcbHJw8yk9Jbpm35YeJCt5/sKR58EvqEHKQu8d/HEK99qm5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758849705; c=relaxed/simple;
	bh=Qf7Aixfg+ZsH4rCpuTDs20y0ntBGG8SleC6ZBW3wAKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cvA49D+lV5Dc09ay5QCpOK7kkY6p0EPyJrjctL66fsbUy2SWAfNhKdmj+usbaEa/xUjz4WV+g+X4Ez3LzUDDc9USvvKTRgAJcQmWjO+2NfUSD0twe0m8ivLEjuXtgEc7L3aUiJVLHLU4uJRu3CU0MgQNky1L7E2BxkjBtqji9LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQv5FkTF; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQv5FkTF"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so1531653b3a.1
        for <imx@lists.linux.dev>; Thu, 25 Sep 2025 18:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758849704; x=1759454504; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AP6fJWx+DDl8KhZETli23Qj60jKeOdbMieamHjTLXYo=;
        b=UQv5FkTFkqyCsN7Sw9bjBgpO8Hz/1mQYDRAOxidPuv7noY5jbTXaFbzfZnzIjFvSzN
         ua6G4b9oUz8Mj7xvu0CO8gnKdqBmlloeapF8UdLBIs5m0C8G2yspOD9miapYZOBojR+j
         CKGNWq0Z90RyDIUTwTE9rnNCXv+mpIzAHwYLTmG5Dd9Alu9gT6qIV+f2OXTXFTvLfEQJ
         uHOZbaE6xwTC2OOOhV8HR7HU9fM905YyK6SWNjt+bua0b/p37JvfFhI+QqBRz2aCjwgX
         /ZqivyM9syWUX/gcTKzdRA0rZ3j84FXISanYgokWLeok9/Yu5Ld6RBMOMsCf3IcjooU7
         1eLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758849704; x=1759454504;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AP6fJWx+DDl8KhZETli23Qj60jKeOdbMieamHjTLXYo=;
        b=Jp4oyrgcsNO0o83tup9eK4kMaHWFzmrSgGCKwvL3uCojstm4dR9mC5IdiN0IsjhCC5
         e/hC/ymkfE8/kM5rFmCqUz5qaZkoLKBs/Rv4g2/DtJ4FCjVB/W0mgt8721ZuPyvh/we1
         o+xTIm74c87ujby9cofycYQqmheuDGwCIze1EfnlCyIi6iNk8VDIhx//iNk8m6Wes/bT
         ztAERc+Jcmr7Ke6jixP7ERFW4h6UXYorANCbl3HGWQjAPRejytgOOQ9T7OMPQ4wL7U6o
         9isLOX2Ok8wnx4l5Qe7jsIyQ59MZ9U/WGy7WXw+y3gccUQ7tArArgrbpYonMjRIxNsdh
         C9KQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlt44ma925j5CAkn1qNLge0GzYhfZhsq6+LbMNeAG0i9Vysi3eZxkMIJBz0T06zTOOgS8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxuatoBNH4CdbltiZgwdALuMQRHq8FbGe4Q3a0MYb8R+6AJ6TRH
	shbI+j4yHD1C+EG0cL9X7+XpekKN17OSbEIXYMXLGptTl2XhOKcEtuWoEoAaKo4E
X-Gm-Gg: ASbGncttpUee8gqhyk8EY4xkRascsZNmu9IZhkh/ELzwH+MHj0HVuIGECBBdlRU5PJT
	s5lON6bQfAlz5GIO26J8X4GnyVRZ07lsNDbU23nE7WPvHRquMQDWqJqEGZrsqnpPEwZGkq7SLGU
	vLkNX7RMl9q2BQP4zoFDf3yNUbt/gpHK7W+7A/PHGRSNo6C/KjqMlJ9un7Uy9v0gJ66dnEmfEmB
	ZszHn4rOx6tUAKPLi/Z4prkjKuVq7h2VlUiDCX2WAMwupGKtQhbVgUk70iHjuHzNBFdUo4kfEzw
	so39gXrQWLXWzakGVH7ZaxHQxt586nt4Q0hWVlEbAKiFvLE8gvUlQDT0couVld8LvOw1HsdnXtD
	pTfv+agF7PgkbrZWGU8FUBcA2EJuGT+YBC4c=
X-Google-Smtp-Source: AGHT+IH7AU9odF5p04RR7XTxrYV8lFhFoYCRERAsrchheebfwRcifSg/WunbI2lPkJCi9K5QgUVHCw==
X-Received: by 2002:a05:6a20:a122:b0:248:86a1:a242 with SMTP id adf61e73a8af0-2e9a0b9b2e5mr5509072637.4.1758849703636;
        Thu, 25 Sep 2025 18:21:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102b5dfd6sm3112336b3a.68.2025.09.25.18.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 18:21:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 25 Sep 2025 18:21:42 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: hwmon: (lm75) allow interrupt for
 ti,tmp75
Message-ID: <e6143356-3de1-4be1-a9c1-6a250a5e9390@roeck-us.net>
References: <20250925192219.303825-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925192219.303825-1-Frank.Li@nxp.com>

On Thu, Sep 25, 2025 at 03:22:19PM -0400, Frank Li wrote:
> Allow interrupt for ti,tmp75 because chip has open drain ALERT signal.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Guenter

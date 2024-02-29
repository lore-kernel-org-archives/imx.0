Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com [209.85.221.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA0714A4FF
	for <imx@lists.linux.dev>; Thu, 29 Feb 2024 20:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709239648; cv=none; b=Au0IJP4LGuPgNe8esk0gzIBBXyZhWM1vf2iKTPzpsrzBhVfEmw/yetn6vbSYdaD/UfaNETO3rViZbPEQSGtY9hWNTjuEaimolHoY3DPfXlitNHh4NZHDmhOmhMNWMNGdZFvl7f+c926NAzjoQOw54mlFVFHybN1MZkyyfAPGgeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709239648; c=relaxed/simple;
	bh=e3iO4PE8zZFiXmyEzBX4oyJQfWLrr/QEfN3E87LeW4o=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YpGrFTeIdiYld9o3uAJhXsd5TsOwBmieBquV+FaW9Y/pe1nkqzz7MJjBzr6VbUK8WRL1YkZOFN0+uDpSoCQnB4ZTlhy2rdn1GHXh89Sn9+bf7p/+IVBo0/J/IZnRNS7FhYTABRnGDLZnWtSvVeKBpNo4zCN+PyMfqzQQU+c86QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iGeHKaSF; arc=none smtp.client-ip=209.85.221.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iGeHKaSF"
Received: by mail-vk1-f196.google.com with SMTP id 71dfb90a1353d-4d33e0c1b3eso400920e0c.2
        for <imx@lists.linux.dev>; Thu, 29 Feb 2024 12:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709239645; x=1709844445; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e3iO4PE8zZFiXmyEzBX4oyJQfWLrr/QEfN3E87LeW4o=;
        b=iGeHKaSFSWEw0pbp1+u2adzyR/HQe0b3hnJSGIcn4aYIKXDdq7Ey5rCnumIv5WUw5S
         8MT+d7Nu9YytlZCettV2JvcKhZAluvr7DXGJ4tN+4Eh2HC/Lrp/sDKCT5ZHYuf91ZtnO
         I9xuU4iqj5sDGBmho4dA5bw2XvEbpiKx7ixLBAse528CVrQVRcIWBR9T41QnIPWxAOAe
         ir3ATn5BFU1EBfJeBWF0KyCpJjxCvHgVQZZ/hVbqVTZ38LMua3ruTnbLDd6nS6Zn8Cwj
         AwXAuDe9lq8m/n2ZLz2V7gD2OINCHzY+xFP1V1luQnEueY0WGVw30JVMVbXaKWgtEgbi
         0hhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709239645; x=1709844445;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e3iO4PE8zZFiXmyEzBX4oyJQfWLrr/QEfN3E87LeW4o=;
        b=VOffboW4KEGQWWrpPcZ0X+jxR4YEoC5QuhxNaLi8f7vU1HUd6VNz1cF2cjw4+mEFZi
         mwkZkSMGyiRhV18z5ugDiMwU0zDkqSs1jNB1YTUmzs8qzN1xguwSndmY5KHnCapzXN4d
         61HB2dTwXMLTK284ns94zJOGbwPQpHCbhxTmDjoC26F52GzR4cBrs/ZVrnUWbTzeujqh
         kNEo1pX7BN4cYNcTAEWsWAXeNNmlboCR7oDuKhAL0eYuoRQTXP8ELf6/Q7urOO6KuAeK
         3ELrQfuboj3ht3FjOGDwAdaEsj0qEPeIl6gVUEMl/CbhWSM5Snxup6044Q8qlqrpXAQn
         TWlw==
X-Forwarded-Encrypted: i=1; AJvYcCX/GKsoFeGTqOhM9jyf8I9gdbgQRsyx+c3pl83jy/pFXIaU3xMcIFQVjrXdx/WaFrQhZjOy+Bse+2d/Mos+IUg8cTwQ
X-Gm-Message-State: AOJu0YzT+9rDviidWJs+5Zy0vPSZcHP6XflGyY+3kiLIRPKC9bnIZD2S
	pBQcEFykDYU2tpkv87EptTU+ezVnndKFFh0tR4P5EcJcu1a598+zu3ujgUgtqzylzAGAn5Pl2FG
	WfTeowYHKqhF8p1IT5DJnqwHMOcs=
X-Google-Smtp-Source: AGHT+IFlFI+SkrXuJzuExSoVJwjiVwZzFzTShlwirG6fQgwXKzo0TY0B+KMp7/rUP7jx4nFtDHVX7a9P3WD9V28YzWE=
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a1f:4f41:0:b0:4c8:ee1:5a0b with SMTP id
 d62-20020a1f4f41000000b004c80ee15a0bmr3074643vkb.15.1709239644819; Thu, 29
 Feb 2024 12:47:24 -0800 (PST)
Received: from 170827741999 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Feb 2024 12:47:24 -0800
From: 0x520.eth@gmail.com
In-Reply-To: <CAC5d1WLVsXR3PvovoviRoTHqh4h7+e=mMM4CyeazdFyNdiE5wQ@mail.gmail.com>
References: <CAC5d1WLVsXR3PvovoviRoTHqh4h7+e=mMM4CyeazdFyNdiE5wQ@mail.gmail.com>
Date: Thu, 29 Feb 2024 12:47:24 -0800
Message-ID: <CAAsV2_j2obNjd7Ci9f+ysGveACxF63LUXNTh=aShg86_FK8dKA@mail.gmail.com>
Subject: Quick Reply Extension Testing
To: harrynicomama@gmail.com
Cc: extensiontest66@gmail.com, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> Testing footer.




==============================
Replied with love by Quick Reply Extension
https://github.com/HarryWangATX/quick-reply-extension

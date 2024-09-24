Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F65145FE8
	for <imx@lists.linux.dev>; Tue, 24 Sep 2024 11:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727176589; cv=none; b=Xr+TX73yOFNar4R76ouFYz5vn/Pj0z1j39Hfsblg4R8DUtBXadf1vS6UrMTswGF3UYQBF0IXIeWJ36BZAj15uVPPpi8LIpzZTfFgWXr4SQ/WpyXUMGVL/mevbqE9/8w+MxEC7YesXqBmYrbzBfwOFLyt8qQMKiemuWrHtVWMZkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727176589; c=relaxed/simple;
	bh=ZJnHAssklkneKFT4wY50362h9HDBf9imld/GaH8qaPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rawnhOhQp90YkAQK4iB+25i2eNTL9CzWSSd/euUTCMjcS0WuRLGqUUTy/3BHl3b2n0H1XMctxNR+onO1RT80ArJYa7OommnkGylKKyQ4iByAzjJ5s3gEaIXrDv80Ly9yED3CFzxiNIhGoST+8f5SiqT4kdrKEjkoEFTmF5Wrlko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xdkw2pCt; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xdkw2pCt"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5365b6bd901so6272866e87.2
        for <imx@lists.linux.dev>; Tue, 24 Sep 2024 04:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727176585; x=1727781385; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJnHAssklkneKFT4wY50362h9HDBf9imld/GaH8qaPk=;
        b=Xdkw2pCt5Ijj3WrzFNGsLpM7x+nhgV1zp8d3dGiESrHzK0lUsKuqHXuInsjcUO3yig
         9s6i0Dvm6TJhhKgpXh2vdvU6mTeka7c7CtRgrzRmlsn0QjxMjXYVbMLK99m9t3uZMhGQ
         pHDTtuRyB0CK+oSZccDbofdFDDDqIGckAff8cITxY23Em079/ydmhNdtsgp/w4ecgp4H
         86VSYMcvxLC3PA3FG3ARWXSZEqJcQ6T/xCRfGJJdN5njkvLGDJwxwLdc7zHHpaYSYV0t
         X4rVzXChJ4Q+khxQqWKKfv5bJ6CyIlQUTpac+3ahbUW8WCjJQHPM6yJr5rhBcqhZq67O
         6aZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727176585; x=1727781385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJnHAssklkneKFT4wY50362h9HDBf9imld/GaH8qaPk=;
        b=n/TLhj7JOqDB8qptDc4Zz6pgyjqTaMlqeDhxgGa/QlUTEG0CNi/Hx7dVqXLl2vqNie
         QnAdl8FEa5o12R+cVqYu2uVk0I4xVOjDAF3ZSGgV7MWmGiUZ+UcU4O2ZFAP0fBYAtllv
         vOMdCJrW7HmhBdmoxKbNN1D5203DarcKdmQViSxdxtnpVBEu/RS25TAGsgEvMcdGqjF4
         BsYxQcbsC7EgWUonMUHjmLSkcY4vbYvVTj0cBqveUIY4r5sra8r2lXOrPQZpsQJ05oWD
         0GegXy+RdkdkFJNaRJQJoGp/2NuC3HW8LxI6acWoPJul9e2FwSSKXgUQZ612l9GGukQP
         gj9A==
X-Forwarded-Encrypted: i=1; AJvYcCV7H5/4u0fAD7sNMyFZ1+fTyvhNwNCrbb51BOUuvTFLO0UOsKxZUpgjcSZXcUHPhyyVR10=@lists.linux.dev
X-Gm-Message-State: AOJu0YyY2OaGvpV6/pKoP+8V31o8KFrcohz9tdtEYDJmWsjlUVl21Ak5
	Hrtmb7J6Q2XcC8JalGqhyJTBqdoPDVCN1HyEfAfT+kNDzyL9VgTagG9N4f2xB9tvrenGpezY51N
	khuvJNOS/6sOfvYzowfro8kBiLTs=
X-Google-Smtp-Source: AGHT+IH4+cT4zwWzrFXVe0+tKnEFzRr7bKyh0GsnjCOocdPkd+rrwFhT4V3C6MLZrLtYNlVPd5V6oGwHQ5ZqeScaddM=
X-Received: by 2002:a05:6512:ba2:b0:536:554a:b9c8 with SMTP id
 2adb3069b0e04-536ad3d4ed8mr8466982e87.54.1727176585070; Tue, 24 Sep 2024
 04:16:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240915114311.75496-1-laurentiu.mihalcea@nxp.com> <20240915114311.75496-3-laurentiu.mihalcea@nxp.com>
In-Reply-To: <20240915114311.75496-3-laurentiu.mihalcea@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 24 Sep 2024 08:16:13 -0300
Message-ID: <CAOMZO5DR7xaEGj9=mzzFPy6wB0z7-SmvXkMnFH-wSjs01hp=WQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] reset: add driver for imx8ulp SIM reset controller
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Liu Ying <victor.liu@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 15, 2024 at 8:45=E2=80=AFAM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> Certain components can be reset via the SIM module.
> Add reset controller driver for the SIM module to
> allow drivers for said components to control the
> reset signal(s).
>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Who is the original author?

In the NXP kernel, the author is Liu Ying.

If that's still the case the Author field should contain Liu Ying's name.

Please double-check.

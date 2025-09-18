Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1EC246335
	for <imx@lists.linux.dev>; Thu, 18 Sep 2025 05:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758172197; cv=none; b=HRItMFKJMtvH1JmIRlH7mqOM69/WKpEjTsjnvDmfSOIHkhNOD94PIZBOTW2J/896vSIgJUh7Nj45uThrXhZ7v7Sv9EgV3XN6wS/M1rfFKHL6OyvSPSfwSH/QfYJXCYGk2K5Vw8cqJAaDh8c+JmgtwVFqyeLBVOP2cjmsnVqIVV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758172197; c=relaxed/simple;
	bh=cSJ4eUM0DsaOhlcWfrSZ2S7GNwrJAdc8Rw5tLu8gtJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r+gu5Xu/toNqR9gd2xgp0ErwzWieuHmwEYhtB2+u7PxTeXspvhdab81yI2+2wQ6XsyBnFoh+KQL70UmbaeDc9FTsAkhfvWnBoVRgULRO7v1TeaCZGpc6HcBX7ujnUYSx4dZ0Eda+HOGkTkDTNf9rNP/J3DAb7TWKnE/IN8sujzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9NLnAlX; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9NLnAlX"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-323266d6f57so506857a91.0
        for <imx@lists.linux.dev>; Wed, 17 Sep 2025 22:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758172195; x=1758776995; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JzO5J5b/DpAoS9q36wSTyxp4bWMYntWCRlnNr1Ul6mw=;
        b=K9NLnAlXpMROk6dPEoZzflpUNf10AxmvM3Q5DBY597gKCf9Sdd+WPivDlz7Jp6vAZJ
         Jf+wOgR+9r3ETzI39WEEHdw0vvToRDm9qtA+h6N6Be6B41EKdQVAaoKfJtTRKudzmxaG
         17U18MNx3626OiP4btHf5/MQUvH2VXvYkpJeMJsVZtxm22YUzuupdTUYpQFO76js8L/M
         +61PfoxA+ghymiNKPeLQe3AQmzQ6RomLPzyVNPAE82XDmFgTh5T5zRWlFGFQ4hPjTUF4
         MRtZfbwsPJVPeJCLd3KYJ6Q8gW913lACvGLTPHn2hePF8/kiCxA3PKksiOJeelvklp5x
         JAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758172195; x=1758776995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JzO5J5b/DpAoS9q36wSTyxp4bWMYntWCRlnNr1Ul6mw=;
        b=mpCi8IS8O1SlGWwZY+E0RbU0b6UFWXvnHbUkjhZ8KNhgJxcJFhoG7PvC+lvXtbM1z/
         EAB6hYiCqNQDQUMPYBZ4TrZEOiCWBQiiWRufz+srHEIgipMEK7V1UNQ7/TBoYYHpRWcY
         nKbIgwhL9SH2tH6M73sJSp+E38sZvJFJx+J+BLvNKAtbgzVhtCeCXzw3q9RN+JTMMUkx
         pQ7ywPdNCNJm9Ue5eBnbTaLbevMQKmAmuNvscm6fYntORLmRbSIdkjO/IzBroK6ihIuY
         ZAsKgBAhEBwa0rCj+MqFclt2R1/ZbnrpUkNF9SnxBYFNwA1Vf72t3wInXSpyGnqNCjXb
         QRHQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6/FFB7EENEl4Xz8lZS0OT36IRWz2JyejBbaKLE8vJBWotFTen5ltSq4MwsM6DBbJnVkc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxoEUBlHjVYDh12z8Wk6niJFmwaFlYN1BUr0Y3VGNBtghuq2rsL
	6MGVIUwNoA9i17AryB3FGp3LQGMryc5JUDdnYId3i1ZMwiwYX1c0WSkG
X-Gm-Gg: ASbGncsVUuG5GbiMscJNWVVdbe7JX/JRWd4pJesi7jYy/Jrf+NC1ljzGjRTB2NMH7Hd
	mJmA974XMXrWg+shovS7k7l44xvXpL23TIy/+B3eo5Wl2+a+k+HClQ1v1t+/lM2gmYyGUDRuSG1
	PlWsfsUjBQzSegMQutqMX7AJhcPqP9nJqEvPROk03gAFwbcqPvTyyR/0HZWc6bMa8Onn6ARGVQA
	Rgi+AgC2Z2boJbbXrDTOv4vVVuLBPxCAdKMs/rCKiviU9kPfjO33CqmSCAGdky2ugBTcy1KbAKe
	evua/7nUdSxhNilBhcn49/3MzvmFdDK5OBjYJYyJYo+BRqI5QaEufKNuoUjRJz875w2n1nMBfOk
	YndPUtDdKGlOdL8sZ6+FuHS/ZEu/1lO+bSiHpAXTfsymHP6ZkfhP8
X-Google-Smtp-Source: AGHT+IEoyQwkdhcbO2KKAnocbbWtxOraH4oEPJ9rZeaTPzEToqLKVmqvC+7go7FKKDfNLNeEHp+khA==
X-Received: by 2002:a17:90a:e7c9:b0:32e:329d:3062 with SMTP id 98e67ed59e1d1-32ee3f7431fmr6979916a91.19.1758172195070;
        Wed, 17 Sep 2025 22:09:55 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:194b:8358:5c91:3d3d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed278b065sm4122687a91.29.2025.09.17.22.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 22:09:54 -0700 (PDT)
Date: Wed, 17 Sep 2025 22:09:52 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: input: convert tca8418_keypad.txt to
 yaml format
Message-ID: <htwupxwox3c5fjvjr3nxc5qtotgnlesit2jnswg3g37a5tku7t@npyzyv7mtwr3>
References: <20250916171327.3773620-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916171327.3773620-1-Frank.Li@nxp.com>

On Tue, Sep 16, 2025 at 01:13:26PM -0400, Frank Li wrote:
> Convert tca8418_keypad.txt to yaml format.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thank you.

-- 
Dmitry

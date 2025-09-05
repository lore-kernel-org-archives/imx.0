Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355B026F2B4
	for <imx@lists.linux.dev>; Fri,  5 Sep 2025 19:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757099867; cv=none; b=NAkcJwn/nU66W8/O16Tzn7NVRt0T9G0tt4u7t8cJRn5RxFp4LYNt9LelTTwLrCd6OEog6a+UK+oo1tTUtFCNhIivoRd/7bxo2OHoa9Y8oQ+WMlvG5CWTDK5DoftKv/u7NhuWyPSvji+agf6PoGMxzq7Iz/Nj8CCnXh9qVyVmmVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757099867; c=relaxed/simple;
	bh=d9riUk8d4MeIl+PcvKeh50CTyzrEM8TlhBq2jX/imDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KDWdR9WOY8Zce9zSBpO9rvQ2lfSTBWoC77D1kkhLJ6iGNLajzTDo0TlTNuW85vaGhJOOuS0rrmHMTFZ03dX+o17/hFBN88y5aq2P8rngQF81E5JQl+8Cqjl573b7sRufyv0N7YPedopXdc3TebewUSozoyJOKwRZgsJj2W5CXt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mOG+v7Og; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mOG+v7Og"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55f98e7782bso2991116e87.0
        for <imx@lists.linux.dev>; Fri, 05 Sep 2025 12:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757099863; x=1757704663; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9riUk8d4MeIl+PcvKeh50CTyzrEM8TlhBq2jX/imDQ=;
        b=mOG+v7OgiB1NUNwTC+GsEQBaB2AlfOH33/3x5DxfYKWFawfg/wvH/ytyJREVgz/abx
         y+dvy/04dJNx2zGakkm98PxNLb8Aw5OKMXOiCw6/nEw/1GFmxL9Ais/GbAgYeT5Yc12e
         LvfnfoGQz4HzKf9QTjjrpj6oowPK4QgQTcU1j5Rbj+B4xmt2nN/6ppQhkUzHUVp5thVX
         cQ6WxA9ddVlOjG+C6LYxEeGz2XNPoNGMH1Rx8hM10dHYyceCQhsyVv51e189LoAhY2xs
         +Hbd25IYnzfg6jCdMfxFWlIAVfwDGvDdtZ/smKAPSmBQ8lMvy9n1s3m8VwEBnMsycm4P
         VIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757099863; x=1757704663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d9riUk8d4MeIl+PcvKeh50CTyzrEM8TlhBq2jX/imDQ=;
        b=LqazD8b+6tmb9HXUvv5MKnrKtKRCAOj3S4lNOL+460e1MjUPN511mF42B3nvltm2zv
         KwvjGomGNUTzgE+tfEXjKq5Nt5vJfuc4sllOqwPxjiqlEFYuogWTrJe5qHLQO4aTHL9m
         9HbOA5tr17d1skoGMgS8jpVprgXwsw5kuXuqfRQ+/EYr0LvyFYV+p6+Lb8KP8O44Ia5w
         vXaHycGlSfkWg84Z28i82qV0HnD/Bi469MWOwGZpc2wRntv+/Aw0km78gvkRqlDmHX/b
         kMcEVRizeROI/J5EGYBTtqRJxISLUnsxYwfUm+zng90W2pukoXXOsR6GT4pqX3ozUxWR
         LE4w==
X-Forwarded-Encrypted: i=1; AJvYcCVAIk8FSnRsqKSdKhYAexC/GF4637s3GucrBS7hqh2Lwxcljmx2l9NOQPT6apA44zg9ODs=@lists.linux.dev
X-Gm-Message-State: AOJu0YyjohMqPZf8Too9ow3Q3EZ0PE67vf3sJmYE30rAwFtydkHDoAPW
	e4UBrpUqVdcYeSXcuJVfgk2VVxuJxPEfsNuAJOb/v7Cbieqyn0gOB0EnT1iXkVciYThTaKhQgsq
	RjXnBeYpPB6mT073c8/Vg9v5haEGTGyY=
X-Gm-Gg: ASbGnctzoIvtUGB7lYAdlR7lXMz39zoMFLizUcyy2RSKCuqvCpl6TiBiL1zFwYdc6B/
	P7qdOvjNf75twGjB21i5JeVW27+oDJj4BYyJk+rKKoKk3qCoj0NxYERevjX/7sQDyfFBMEZgVpl
	ttZNbQX5xK4nO2Mu+wVksTBY1Mr6F/nR6g1ka2TM5sS8IEDZMi3DPSTbgM7GUDT5FkrXU62xUE5
	zKb68+1aJ8TBA7Leno9G7VNXiyiaqry7HNIEhXqM/xx27bbAw==
X-Google-Smtp-Source: AGHT+IExNr7E9rD7sUYs1T/yf3koGRYXu/DH4f4r9pUApNVPygT+m2pxQCLbRRRJxgQIeFsJGBe+CsQwzmlorjCUV5s=
X-Received: by 2002:a05:6512:144e:10b0:560:a641:6499 with SMTP id
 2adb3069b0e04-560a6416d00mr1270504e87.9.1757099862969; Fri, 05 Sep 2025
 12:17:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250905190645.609762-1-Frank.Li@nxp.com>
In-Reply-To: <20250905190645.609762-1-Frank.Li@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 5 Sep 2025 16:17:31 -0300
X-Gm-Features: Ac12FXz9svkM5bN90I8Wbp08WUFjnKgc2W1OxAbDeHh4SU05q4l2K1Kn6ku9BL4
Message-ID: <CAOMZO5AKcNHvRpjhmGpGfPRaonU+quT=dDJQwLpDjBxTCXkTXQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] dt-bindings: input: convert tca8418_keypad.txt to
 yaml format
To: Frank Li <Frank.Li@nxp.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 5, 2025 at 4:08=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> +title: I2C/SMBus keypad scanner

This title is too generic.

You should include the part number:

title: TCA8418 I2C/SMBus keypad scanner
